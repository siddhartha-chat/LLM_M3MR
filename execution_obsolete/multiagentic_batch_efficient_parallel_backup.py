#!/usr/bin/env python3
"""
Multi-Agent SPSS Script Generation with Transformer + Reviewer feedback loop.
PARALLEL BATCHED VERSION - Processes questions in parallel batches using async operations.

This module implements a two-agent architecture:
- AsyncTransformerAgent: Generates SPSS scripts from survey questions (async)
- AsyncReviewerAgent: Reviews outputs for logic correctness and provides targeted feedback (async)
- AsyncMultiAgentPipeline: Orchestrates the feedback loop with parallel batched input processing
"""

import os
import json
import time
import re
import asyncio
import random
from pathlib import Path
from dotenv import load_dotenv
from typing import List, Dict, Any, Tuple, Optional
from openai import AsyncOpenAI
from datetime import datetime

# Import from existing main.py
from main import SPSSBatchProcessor

# Load environment
load_dotenv()

# Configuration
MAX_FEEDBACK_LOOPS = int(os.getenv("MAX_FEEDBACK_LOOPS", "5"))
BATCH_SIZE = int(os.getenv("MAX_QUESTIONS") or "10")  # Reuse MAX_QUESTIONS as batch size
INCLUDE_TRAINING_IN_ALL = (os.getenv("INCLUDE_TRAINING_IN_ALL", "true").lower() == "true")
TRAINING_CONTEXT_FIRST_BATCH_CHARS = int(os.getenv("TRAINING_CONTEXT_FIRST_BATCH_CHARS") or "60000")
TRAINING_CONTEXT_OTHER_BATCH_CHARS = int(os.getenv("TRAINING_CONTEXT_OTHER_BATCH_CHARS") or "5000")
MAX_COMPLETION_TOKENS_TRANSFORMER = int(os.getenv("MAX_COMPLETION_TOKENS_TRANSFORMER") or "5000")
MAX_COMPLETION_TOKENS_REVIEWER = int(os.getenv("MAX_COMPLETION_TOKENS_REVIEWER") or "16000")
INPUT_FILE_NAME = os.getenv("INPUT_FILE_NAME", "")  # Specific file to process

# Rate limiting configuration
GLOBAL_RATE_LIMIT_DELAY = float(os.getenv("GLOBAL_RATE_LIMIT_DELAY", "2.0"))  # Delay between any API calls
MAX_CONCURRENT_REQUESTS = int(os.getenv("MAX_CONCURRENT_REQUESTS", "3"))  # Max concurrent API calls

# Global rate limiter
class GlobalRateLimiter:
    def __init__(self, max_concurrent: int = MAX_CONCURRENT_REQUESTS, delay: float = GLOBAL_RATE_LIMIT_DELAY):
        self.semaphore = asyncio.Semaphore(max_concurrent)
        self.delay = delay
        self.last_request_time = 0
    
    async def acquire(self):
        await self.semaphore.acquire()
        current_time = time.time()
        time_since_last = current_time - self.last_request_time
        if time_since_last < self.delay:
            await asyncio.sleep(self.delay - time_since_last)
        self.last_request_time = time.time()
    
    def release(self):
        self.semaphore.release()

# Global rate limiter instance
rate_limiter = GlobalRateLimiter()

def _supports_temperature(model_name: str) -> bool:
    """Return True if the model supports the temperature parameter."""
    name = (model_name or "").lower()
    return not (name.startswith("o") or name.startswith("gpt-5"))


class AsyncTransformerAgent:
    """Generates SPSS validation scripts from survey question specifications (async)."""
    
    def __init__(self, processor: SPSSBatchProcessor):
        self.processor = processor
        self.client = AsyncOpenAI(api_key=os.getenv("OPENAI_API_KEY"))
        self.validation_cache = {}  # Cache for similar question patterns
        self.model = processor.model
        self.rate_limit_delay = 1.0  # Base delay between requests
        self.max_retries = 3  # Maximum retry attempts for rate limits
    
    def _validate_question_completeness(self, question: Dict[str, Any]) -> List[str]:
        """Early validation to detect incomplete or problematic questions."""
        issues = []
        
        # Check for required fields
        if not question.get("Question ID"):
            issues.append("Missing Question ID")
        if not question.get("question_type"):
            issues.append("Missing question_type")
        if not question.get("Variable ID") and question.get("question_type") != "Hidden":
            issues.append("Missing Variable ID")
        
        # Check for complex patterns that might cause issues
        if question.get("question_type") == "Multi" and not question.get("sub_questions"):
            issues.append("Multi question without sub_questions")
        
        # Check for validation complexity
        conditions = question.get("conditions", [])
        if len(conditions) > 3:
            issues.append(f"High complexity: {len(conditions)} conditions")
        
        return issues
    
    def _get_cached_pattern(self, question: Dict[str, Any]) -> Optional[str]:
        """Check if we have a cached pattern for similar questions."""
        question_type = question.get("question_type", "Single")
        has_conditions = bool(question.get("conditions"))
        has_entry_conditions = bool(question.get("entry_conditions"))
        
        cache_key = f"{question_type}_{has_conditions}_{has_entry_conditions}"
        return self.validation_cache.get(cache_key)
    
    def _cache_pattern(self, question: Dict[str, Any], pattern: str):
        """Cache a successful pattern for similar questions."""
        question_type = question.get("question_type", "Single")
        has_conditions = bool(question.get("conditions"))
        has_entry_conditions = bool(question.get("entry_conditions"))
        
        cache_key = f"{question_type}_{has_conditions}_{has_entry_conditions}"
        self.validation_cache[cache_key] = pattern
    
    async def _make_api_call_with_retry(self, messages: List[Dict], max_tokens: int = None, temperature: float = None) -> str:
        """Make API call with retry logic for rate limiting."""
        for attempt in range(self.max_retries):
            try:
                # Use global rate limiter
                await rate_limiter.acquire()
                try:
                    # Add random jitter to avoid thundering herd
                    if attempt > 0:
                        delay = self.rate_limit_delay * (2 ** attempt) + random.uniform(0, 1)
                        print(f"    ⏳ Rate limit hit, waiting {delay:.1f}s before retry {attempt + 1}/{self.max_retries}")
                        await asyncio.sleep(delay)
                    
                    completion_args = {
                        "model": self.model,
                        "messages": messages,
                        "max_completion_tokens": max_tokens or MAX_COMPLETION_TOKENS_TRANSFORMER,
                    }
                    if temperature is not None and _supports_temperature(self.model):
                        completion_args["temperature"] = temperature
                    
                    response = await self.client.chat.completions.create(**completion_args)
                    return response.choices[0].message.content
                    
                finally:
                    rate_limiter.release()
                
            except Exception as e:
                if "429" in str(e) or "rate limit" in str(e).lower():
                    if attempt == self.max_retries - 1:
                        print(f"    ❌ Rate limit exceeded after {self.max_retries} attempts")
                        raise e
                    continue
                else:
                    raise e
        
        raise Exception("Max retries exceeded")
        
    async def generate_batch_async(self, questions: List[Dict[str, Any]], training_context: str, 
                                 function_def: str = "") -> Dict[str, str]:
        """Generate SPSS scripts for a batch of questions (async)."""
        print(f"\n🔄 AsyncTransformerAgent: Generating scripts for {len(questions)} question(s)...")
        
        generation_template = self.processor.load_prompt_template('user', 'generation_prompt')
        system_prompt = self.processor.load_prompt_template('system', 'system_prompt')
        
        batch_content = "\n\n---\n\n".join([
            self._format_question(q) for q in questions
        ])
        
        user_prompt = generation_template.replace('{TRAINING_CONTEXT}', training_context)
        user_prompt = user_prompt.replace('{BATCH_NUMBER}', '1')
        user_prompt = user_prompt.replace('{BATCH_CONTENT}', batch_content)
        user_prompt = user_prompt.replace('{FUNCTION_DEF}', function_def)
        
        try:
            # Add delay between requests to avoid rate limiting
            await asyncio.sleep(self.rate_limit_delay)
            
            messages = [
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt},
            ]
            
            output = await self._make_api_call_with_retry(
                messages, 
                max_tokens=MAX_COMPLETION_TOKENS_TRANSFORMER,
                temperature=0.2
            )
            
            # Debug: check if output is empty
            if not output or not output.strip():
                print(f"  ⚠️  WARNING: Model returned empty output!")
                print(f"  This might indicate context overflow or model error")
            
            return self._parse_output(output, questions)
            
        except Exception as e:
            print(f"❌ AsyncTransformerAgent error: {e}")
            print(f"  Error type: {type(e).__name__}")
            import traceback
            traceback.print_exc()
            return {}
    
    async def regenerate_subset_async(self, failed_questions: List[Dict[str, Any]], 
                                    reviewer_feedback: List[Dict[str, Any]],
                                    training_context: str,
                                    function_def: str = "") -> Dict[str, str]:
        """Regenerate SPSS scripts ONLY for failed questions with reviewer feedback (async)."""
        print(f"\n🔁 AsyncTransformerAgent: Regenerating {len(failed_questions)} failed question(s)...")
        
        generation_template = self.processor.load_prompt_template('user', 'generation_prompt')
        system_prompt = self.processor.load_prompt_template('system', 'system_prompt')
        
        enhanced_training = training_context
        for feedback in reviewer_feedback:
            if feedback.get('training_example_patch'):
                patch = feedback['training_example_patch']
                enhanced_training += f"\n\n=== ADDITIONAL EXAMPLE (ON-THE-FLY) ===\n"
                enhanced_training += f"Title: {patch['title']}\n"
                enhanced_training += f"Why needed: {patch['why_needed']}\n\n"
                enhanced_training += patch['example']
        
        batch_content_parts = []
        for q in failed_questions:
            qid = q['Question ID']
            feedback = next((f for f in reviewer_feedback if f['question_id'] == qid), None)
            
            question_block = self._format_question(q)
            
            if feedback:
                question_block += "\n\n### REVIEWER FEEDBACK ###\n"
                question_block += f"Root Causes:\n"
                for cause in feedback.get('root_causes', []):
                    question_block += f"  - {cause}\n"
                question_block += f"\nInstructions:\n"
                for instr in feedback.get('instructions', []):
                    question_block += f"  - {instr}\n"
                question_block += "\n### END FEEDBACK ###\n"
            
            batch_content_parts.append(question_block)
        
        batch_content = "\n\n---\n\n".join(batch_content_parts)
        
        user_prompt = generation_template.replace('{TRAINING_CONTEXT}', enhanced_training)
        user_prompt = user_prompt.replace('{BATCH_NUMBER}', 'REGENERATION')
        user_prompt = user_prompt.replace('{BATCH_CONTENT}', batch_content)
        user_prompt = user_prompt.replace('{FUNCTION_DEF}', function_def)
        
        user_prompt += "\n\n⚠️ REGENERATION REQUEST: The above questions failed logic review. "
        user_prompt += "Please regenerate ONLY these questions, addressing ALL reviewer feedback points."
        
        try:
            completion_args = {
                "model": self.model,
                "messages": [
                    {"role": "system", "content": system_prompt},
                    {"role": "user", "content": user_prompt},
                ],
                "max_completion_tokens": MAX_COMPLETION_TOKENS_TRANSFORMER,
            }
            if _supports_temperature(self.model):
                completion_args["temperature"] = 0.2
            response = await self.client.chat.completions.create(**completion_args)
            
            output = response.choices[0].message.content
            return self._parse_output(output, failed_questions)
            
        except Exception as e:
            print(f"❌ AsyncTransformerAgent regeneration error: {e}")
            return {}
    
    def _format_question(self, q: Dict[str, Any]) -> str:
        """Format a question dict into the expected input format."""
        qid = q.get('Question ID', 'UNKNOWN')
        details = json.dumps(q, ensure_ascii=False)
        return f"Question ID:\n{qid}\n\ndetails_normalized:\n{details}\n\noutput_spss_script:\n"
    
    def _parse_output(self, output: str, questions: List[Dict[str, Any]]) -> Dict[str, str]:
        """Parse transformer output into question_id -> script mapping."""
        result = {}
        
        question_blocks = re.split(r'\n(?=Question ID:)', output)
        
        for block in question_blocks:
            if not block.strip() or 'Question ID:' not in block:
                continue
            
            qid_match = re.search(r'Question ID:\s*\n?([^\n]+)', block)
            if not qid_match:
                continue
            
            question_id = qid_match.group(1).strip()
            
            script_match = re.search(
                r'output_spss_script:\s*\n(.*?)(?=\n\nQuestion ID:|\n\n---|\Z)', 
                block, 
                re.DOTALL
            )
            
            if script_match:
                script = script_match.group(1).strip()
                if script and len(script) > 10:
                    result[question_id] = script
        
        print(f"  ✓ Parsed {len(result)} script(s)")
        return result


class AsyncReviewerAgent:
    """Reviews generated SPSS scripts for logic correctness (async)."""
    
    def __init__(self, reviewer_prompt_path: Path, model: str):
        self.client = AsyncOpenAI(api_key=os.getenv("OPENAI_API_KEY"))
        self.model = model
        self.prompt_template = reviewer_prompt_path.read_text(encoding='utf-8')
        self.rate_limit_delay = 1.0  # Base delay between requests
        self.max_retries = 3  # Maximum retry attempts for rate limits
    
    async def _make_api_call_with_retry(self, messages: List[Dict], max_tokens: int = None, temperature: float = None) -> str:
        """Make API call with retry logic for rate limiting."""
        for attempt in range(self.max_retries):
            try:
                # Use global rate limiter
                await rate_limiter.acquire()
                try:
                    # Add random jitter to avoid thundering herd
                    if attempt > 0:
                        delay = self.rate_limit_delay * (2 ** attempt) + random.uniform(0, 1)
                        print(f"    ⏳ Rate limit hit, waiting {delay:.1f}s before retry {attempt + 1}/{self.max_retries}")
                        await asyncio.sleep(delay)
                    
                    completion_args = {
                        "model": self.model,
                        "messages": messages,
                        "max_completion_tokens": max_tokens or MAX_COMPLETION_TOKENS_REVIEWER,
                    }
                    if temperature is not None and _supports_temperature(self.model):
                        completion_args["temperature"] = temperature
                    
                    response = await self.client.chat.completions.create(**completion_args)
                    return response.choices[0].message.content
                    
                finally:
                    rate_limiter.release()
                
            except Exception as e:
                if "429" in str(e) or "rate limit" in str(e).lower():
                    if attempt == self.max_retries - 1:
                        print(f"    ❌ Rate limit exceeded after {self.max_retries} attempts")
                        raise e
                    continue
                else:
                    raise e
        
        raise Exception("Max retries exceeded")
    
    async def pre_analyze_questions_async(self, questions: List[Dict[str, Any]], 
                                         training_context: str) -> str:
        """Pre-analyze questions and curate relevant training examples for transformer (async)."""
        print(f"\n🔍 AsyncReviewerAgent: Pre-analyzing {len(questions)} question(s) to curate training examples...")
        
        analysis_prompt = """You are an expert SPSS script analyst. Your task is to analyze the given survey questions and identify the most relevant examples and patterns from the training context that will help generate correct SPSS validation scripts.

Review the questions below along with the Function definitions provided in the function_def section and the training context, then return a curated selection of:
1. The most relevant training examples that match the question types
2. Key patterns and logic rules that apply
3. Common pitfalls to avoid
4. Specific guidance for these question types

Format your response as a focused training guide that will help the transformer generate correct scripts."""
        
        questions_content = "\n\n---\n\n".join([
            f"Question ID: {q.get('Question ID', 'UNKNOWN')}\n"
            f"Details: {json.dumps(q, indent=2, ensure_ascii=False)}"
            for q in questions
        ])
        
        user_content = f"""TRAINING CONTEXT:
{training_context}

QUESTIONS TO ANALYZE:
{questions_content}

Based on the above questions function definitions and training context, provide a curated training guide with the most relevant examples and guidance."""
        
        try:
            completion_args = {
                "model": self.model,
                "messages": [
                    {"role": "system", "content": analysis_prompt},
                    {"role": "user", "content": user_content},
                ],
                "max_completion_tokens": MAX_COMPLETION_TOKENS_REVIEWER,
            }
            if _supports_temperature(self.model):
                completion_args["temperature"] = 0.1
            response = await self.client.chat.completions.create(**completion_args)
            
            curated_context = response.choices[0].message.content
            print(f"  ✓ Curated training context: {len(curated_context)} characters")
            return curated_context
            
        except Exception as e:
            print(f"❌ AsyncReviewerAgent pre-analysis error: {e}")
            print(f"  Falling back to original training context")
            return training_context
    
    async def review_batch_async(self, expected_logic: Dict[str, Dict[str, Any]],
                                transformer_output: Dict[str, str],
                                training_context: str) -> List[Dict[str, Any]]:
        """Review transformer outputs against expected logic (async)."""
        print(f"\n🔍 AsyncReviewerAgent: Reviewing {len(transformer_output)} output(s)...")
        
        review_content = self.prompt_template + "\n\n"
        review_content += "=" * 80 + "\n"
        review_content += "TRAINING_CONTEXT\n"
        review_content += "=" * 80 + "\n"
        # training_context is already batch-truncated; additionally clamp to 5000 chars for the reviewer
        review_content += training_context[:5000] + "...\n\n"
        
        review_content += "=" * 80 + "\n"
        review_content += "QUESTIONS TO REVIEW\n"
        review_content += "=" * 80 + "\n\n"
        
        for qid in transformer_output.keys():
            expected = expected_logic.get(qid, {})
            generated = transformer_output.get(qid, "")
            
            review_content += f"--- Question ID: {qid} ---\n\n"
            review_content += "EXPECTED LOGIC:\n"
            review_content += json.dumps(expected, indent=2, ensure_ascii=False)
            review_content += "\n\nTRANSFORMER OUTPUT (SPSS):\n"
            review_content += generated
            review_content += "\n\n"
        
        review_content += "=" * 80 + "\n"
        review_content += "IMPORTANT: Return a JSON array with one object per question. Format: [{...}, {...}, ...]\n"
        
        try:
            completion_args = {
                "model": self.model,
                "messages": [
                    {"role": "system", "content": "You are a precise SPSS logic reviewer. Return a valid JSON array with one finding object per question."},
                    {"role": "user", "content": review_content},
                ],
                "max_completion_tokens": MAX_COMPLETION_TOKENS_REVIEWER,
            }
            if _supports_temperature(self.model):
                completion_args["temperature"] = 0.1
            response = await self.client.chat.completions.create(**completion_args)
            
            output = response.choices[0].message.content
            findings = self._parse_review_json(output)
            
            passed = sum(1 for f in findings if f['pass'])
            failed = len(findings) - passed
            print(f"  ✓ Review complete: {passed} passed, {failed} failed")
            
            return findings
            
        except Exception as e:
            print(f"❌ AsyncReviewerAgent error: {e}")
            return [
                {
                    "question_id": qid,
                    "pass": True,
                    "root_causes": [],
                    "instructions": [],
                    "training_example_patch": None
                }
                for qid in transformer_output.keys()
            ]
    
    def _parse_review_json(self, output: str) -> List[Dict[str, Any]]:
        """Parse and validate reviewer JSON output."""
        try:
            output = re.sub(r'```json\s*', '', output)
            output = re.sub(r'```\s*', '', output)
            
            data = json.loads(output)
            
            # Debug: show what we got
            print(f"  [DEBUG] Parsed JSON type: {type(data)}")
            if isinstance(data, dict):
                print(f"  [DEBUG] Dict keys: {list(data.keys())[:5]}...")  # Show first 5 keys
            
            if isinstance(data, dict) and 'findings' in data:
                data = data['findings']
            elif isinstance(data, dict) and 'reviews' in data:
                data = data['reviews']
            
            if not isinstance(data, list):
                if isinstance(data, dict):
                    # Check if dict has question_id key - it's a single finding
                    if 'question_id' in data:
                        data = [data]
                    else:
                        # Check if keys are numeric strings (0, 1, 2...) - array indices
                        keys = list(data.keys())
                        if keys and all(k.isdigit() for k in keys):
                            # Sort by numeric key and extract values
                            sorted_items = sorted(data.items(), key=lambda x: int(x[0]))
                            data = [v for k, v in sorted_items]
                            print(f"  [DEBUG] Converted numeric-keyed dict to list of {len(data)} items")
                        # Dict might have question IDs as keys
                        elif data and all(isinstance(v, dict) for v in data.values()):
                            mapped = []
                            for k, v in data.items():
                                if 'question_id' not in v:
                                    v = {**v, 'question_id': k}
                                mapped.append(v)
                            data = mapped
                        else:
                            print(f"⚠️  Expected list or dict with findings, got unrecognized dict")
                            return []
                else:
                    print(f"⚠️  Expected list, got {type(data)}")
                    return []
            
            validated = []
            for item in data:
                if not isinstance(item, dict):
                    continue
                validated.append({
                    "question_id": item.get("question_id", "UNKNOWN"),
                    "pass": bool(item.get("pass", True)),
                    "root_causes": item.get("root_causes", []),
                    "instructions": item.get("instructions", []),
                    "training_example_patch": item.get("training_example_patch")
                })
            
            return validated
            
        except json.JSONDecodeError as e:
            print(f"❌ JSON parse error: {e}")
            print(f"Output was: {output[:500]}...")
            return []


class AsyncMultiAgentPipeline:
    """Orchestrates the AsyncTransformer + AsyncReviewer feedback loop with parallel batched processing."""
    
    def __init__(self):
        print("🚀 Initializing Async Multi-Agent Parallel Batch Pipeline...")
        self.processor = SPSSBatchProcessor()
        self.model = self.processor.model
        
        self.transformer = AsyncTransformerAgent(self.processor)
        
        reviewer_prompt_path = Path("prompts/reviewer/reviewer_prompt.txt")
        self.reviewer = AsyncReviewerAgent(reviewer_prompt_path, self.model)
        
        self.output_dir = Path("output")
        self.review_dir = self.output_dir / "review_reports"
        self.review_dir.mkdir(parents=True, exist_ok=True)
        
        print(f"  Model: {self.model}")
        print(f"  Batch size: {BATCH_SIZE} questions per batch")
        print(f"  Max feedback loops per batch: {MAX_FEEDBACK_LOOPS}")
        print(f"  Parallel processing: ENABLED")
    
    async def run_async(self):
        """Main execution loop (async)."""
        start_time = time.time()
        
        print("\n" + "="*80)
        print("ASYNC MULTI-AGENT SPSS SCRIPT GENERATION (PARALLEL BATCHES)")
        print("="*80)
        
        print("\n📚 Loading training context...")
        training_context = self.processor.load_training_context()
        
        # Get generation files - either specific file or all files
        if INPUT_FILE_NAME:
            # Process specific file
            gen_file_path = self.processor.generation_dir / INPUT_FILE_NAME
            if not gen_file_path.exists():
                raise FileNotFoundError(f"Input file not found: {gen_file_path}")
            generation_files = [gen_file_path]
            print(f"\n📋 Processing specific file: {INPUT_FILE_NAME}")
        else:
            # Process all files (original behavior)
            generation_files = self.processor.get_generation_files()
            print(f"\n📋 Found {len(generation_files)} file(s) to process")
        
        # Process files in parallel
        file_tasks = [self._process_file_async(gen_file, training_context) for gen_file in generation_files]
        await asyncio.gather(*file_tasks, return_exceptions=True)
        
        elapsed = time.time() - start_time
        print("\n" + "="*80)
        print(f"✅ ASYNC PIPELINE COMPLETE in {elapsed:.1f}s")
        print("="*80)
    
    def _group_questions_by_complexity(self, questions: List[Dict[str, Any]]) -> List[List[Dict[str, Any]]]:
        """Group questions by complexity for optimal batching."""
        def calculate_complexity(q):
            complexity = 0
            # Base complexity by question type
            type_complexity = {"Single": 1, "Multi": 2, "Open": 1, "Hidden": 0}
            complexity += type_complexity.get(q.get("question_type", "Single"), 1)
            
            # Add complexity for entry conditions
            if q.get("entry_conditions"):
                complexity += len(q.get("entry_conditions", []))
            
            # Add complexity for validation conditions
            if q.get("conditions"):
                complexity += len(q.get("conditions", []))
            
            # Add complexity for sub-questions
            if q.get("sub_questions"):
                complexity += len(q.get("sub_questions", []))
            
            return complexity
        
        # Sort questions by complexity
        questions_with_complexity = [(q, calculate_complexity(q)) for q in questions]
        questions_with_complexity.sort(key=lambda x: x[1])
        
        # Group into balanced batches
        batches = []
        current_batch = []
        current_complexity = 0
        max_complexity_per_batch = 15  # Adjust based on testing
        
        for question, complexity in questions_with_complexity:
            if current_complexity + complexity > max_complexity_per_batch and current_batch:
                batches.append(current_batch)
                current_batch = [question]
                current_complexity = complexity
            else:
                current_batch.append(question)
                current_complexity += complexity
        
        if current_batch:
            batches.append(current_batch)
        
        return batches

    async def _process_file_async(self, gen_file: Path, training_context: str):
        """Process a single generation file through parallel batched feedback loop with smart batching."""
        print("\n" + "="*80)
        print(f"ASYNC PROCESSING: {gen_file.name}")
        print("="*80)
        
        all_questions, function_def = self._parse_generation_file(gen_file)
        expected_logic = {q['Question ID']: q for q in all_questions}
        
        print(f"  Total questions in file: {len(all_questions)}")
        
        # Use smart batching instead of fixed batch size
        batches = self._group_questions_by_complexity(all_questions)
        print(f"  Smart batches created: {len(batches)}")
        print(f"  Batch sizes: {[len(batch) for batch in batches]}")
        
        # Create batch tasks for parallel processing
        batch_tasks = []
        for batch_idx, batch_questions in enumerate(batches):
            # Determine training context for this batch
            if batch_idx == 0:
                batch_training_context = training_context
            else:
                if INCLUDE_TRAINING_IN_ALL:
                    batch_training_context = training_context
                else:
                    batch_training_context = ""  # omit training for later batches
            
            # Create async task for this batch
            task = self._process_batch_async(
                batch_questions, expected_logic, batch_training_context, 
                function_def, gen_file, batch_idx
            )
            batch_tasks.append(task)
        
        print(f"\n🚀 Starting parallel processing of {len(batches)} batches...")
        
        # Process all batches in parallel
        batch_results = await asyncio.gather(*batch_tasks, return_exceptions=True)
        
        # Combine results from all batches
        all_passing_outputs = {}
        all_failed_questions = []
        
        for batch_idx, result in enumerate(batch_results):
            if isinstance(result, Exception):
                print(f"\n❌ Error processing batch {batch_idx + 1}: {result}")
                # Mark all questions in this batch as failed
                start_idx = batch_idx * BATCH_SIZE
                end_idx = min(start_idx + BATCH_SIZE, len(all_questions))
                batch_questions = all_questions[start_idx:end_idx]
                for q in batch_questions:
                    all_failed_questions.append({
                        "question_id": q['Question ID'],
                        "error": str(result),
                        "batch": batch_idx + 1
                    })
            else:
                batch_outputs, batch_failures = result
                all_passing_outputs.update(batch_outputs)
                all_failed_questions.extend(batch_failures)
                print(f"  Batch {batch_idx + 1} complete: {len(batch_outputs)} passed, {len(batch_failures)} failed")
        
        # Write final outputs
        print("\n" + "="*80)
        print(f"ASYNC FILE PROCESSING COMPLETE: {gen_file.name}")
        print(f"  Total questions processed: {len(all_passing_outputs)}/{len(all_questions)}")
        print(f"  Total failures: {len(all_failed_questions)}")
        print("="*80)
        
        self._write_outputs(gen_file, all_passing_outputs, expected_logic, all_failed_questions)
    
    async def _process_batch_async(self, batch_questions: List[Dict[str, Any]], 
                                 expected_logic: Dict[str, Dict[str, Any]],
                                 training_context: str, 
                                 function_def: str,
                                 gen_file: Path,
                                 batch_idx: int) -> Tuple[Dict[str, str], List[Dict[str, Any]]]:
        """Process a single batch through the async feedback loop."""
        batch_outputs = {}
        remaining_questions = batch_questions.copy()
        
        # NEW: Reviewer pre-analysis on first loop to curate training context
        curated_training_context = None
        
        for loop in range(MAX_FEEDBACK_LOOPS):
            print(f"\n  🔄 Async Loop {loop + 1}/{MAX_FEEDBACK_LOOPS} (Batch {batch_idx + 1})")
            
            # Early validation to skip problematic questions
            if loop > 0:
                valid_questions = []
                skipped_questions = []
                
                for q in remaining_questions:
                    issues = self.transformer._validate_question_completeness(q)
                    if issues:
                        print(f"    ⚠️  {q.get('Question ID', 'UNKNOWN')}: Skipping due to issues: {', '.join(issues)}")
                        skipped_questions.append(q)
                    else:
                        valid_questions.append(q)
                
                if not valid_questions:
                    print("    No valid questions to process, stopping feedback loop")
                    break
                
                remaining_questions = valid_questions
            
            if loop == 0:
                # NEW: Call reviewer first to curate training examples
                curated_training_context = await self.reviewer.pre_analyze_questions_async(
                    remaining_questions, training_context
                )
                
                # Check cache for similar patterns
                cached_outputs = {}
                uncached_questions = []
                
                for q in remaining_questions:
                    cached_pattern = self.transformer._get_cached_pattern(q)
                    if cached_pattern:
                        cached_outputs[q['Question ID']] = cached_pattern
                        print(f"    🎯 {q['Question ID']}: Using cached pattern")
                    else:
                        uncached_questions.append(q)
                
                # Generate only for uncached questions
                outputs = {}
                if uncached_questions:
                    new_outputs = await self.transformer.generate_batch_async(
                        uncached_questions, curated_training_context, function_def
                    )
                    outputs.update(new_outputs)
                
                # Combine cached and new outputs
                outputs.update(cached_outputs)
                # Fallback: if model returned empty for this loop, retry once with smaller context
                if len(outputs) == 0 and curated_training_context:
                    print("    🔁 Empty output detected; retrying once with reduced curated context (2000 chars)...")
                    reduced_ctx = curated_training_context[:2000]
                    outputs = await self.transformer.generate_batch_async(
                        remaining_questions, reduced_ctx, function_def
                    )
            else:
                failed_feedback = [f for f in findings if not f['pass']]
                # First time in this batch we send reviewer feedback to transformer (loop == 1)
                if loop == 1:
                    try:
                        qids = [f.get('question_id', 'UNKNOWN') for f in failed_feedback]
                        print(f"    [DEBUG] AsyncReviewer->AsyncTransformer feedback (first send, batch {batch_idx + 1})")
                        print(f"    Count: {len(failed_feedback)} | QIDs: {qids}")
                        preview = json.dumps(failed_feedback, ensure_ascii=False)[:2000]
                        print(f"    Payload preview (first 2000 chars): {preview}")
                    except Exception as dbg_e:
                        print(f"    [DEBUG] Could not print reviewer feedback preview: {dbg_e}")
                # Use curated context for regeneration if available
                context_to_use = curated_training_context if curated_training_context else training_context
                outputs = await self.transformer.regenerate_subset_async(
                    remaining_questions, failed_feedback, context_to_use, function_def
                )
            
            findings = await self.reviewer.review_batch_async(expected_logic, outputs, training_context)
            
            # Log findings for this batch
            self._log_batch_findings(gen_file, findings, batch_idx, loop)
            
            # Collect passing outputs and cache successful patterns
            for finding in findings:
                qid = finding['question_id']
                if finding['pass'] and qid in outputs:
                    batch_outputs[qid] = outputs[qid]
                    
                    # Cache successful pattern for future use
                    question = next((q for q in batch_questions if q['Question ID'] == qid), None)
                    if question:
                        self.transformer._cache_pattern(question, outputs[qid])
            
            failed = [f for f in findings if not f['pass']]
            if not failed:
                print(f"    ✅ All {len(findings)} questions passed!")
                return batch_outputs, []
            
            failed_qids = {f['question_id'] for f in failed}
            remaining_questions = [q for q in batch_questions if q['Question ID'] in failed_qids]
            
            print(f"    ⚠️  {len(failed)} question(s) still failing, will retry...")
            
            if loop == MAX_FEEDBACK_LOOPS - 1:
                print(f"    ⚠️  Reached max loops, {len(failed)} questions failed in this batch")
                # Mark failed questions
                failed_list = [
                    {
                        "question_id": f['question_id'],
                        "root_causes": f.get('root_causes', []),
                        "instructions": f.get('instructions', []),
                        "batch": batch_idx + 1,
                        "loops_attempted": MAX_FEEDBACK_LOOPS
                    }
                    for f in failed
                ]
                return batch_outputs, failed_list
        
        return batch_outputs, []
    
    def _parse_generation_file(self, gen_file: Path) -> Tuple[List[Dict[str, Any]], str]:
        """Parse generation markdown file into question list."""
        with open(gen_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        sheet1_match = re.search(r'## Sheet1\n(.*?)(?=## function_def|$)', content, re.DOTALL)
        function_def_match = re.search(r'## function_def\n(.*?)$', content, re.DOTALL)
        
        sheet1_content = sheet1_match.group(1) if sheet1_match else ""
        function_def_content = function_def_match.group(1) if function_def_match else ""
        
        question_blocks = re.split(r'\n(?=Question ID:)', sheet1_content)
        questions = []
        
        for block in question_blocks:
            if not block.strip() or 'Question ID:' not in block:
                continue
            
            qid_match = re.search(r'Question ID:\s*\n([^\n]+)', block)
            if not qid_match:
                continue
            qid = qid_match.group(1).strip()
            
            details_match = re.search(r'details_normalized:\s*\n(.*?)(?=\n\noutput_spss_script:|\noutput_spss_script:|\n\n---|\n---)', block, re.DOTALL)
            if details_match:
                try:
                    details_str = details_match.group(1).strip()
                    details = eval(details_str)
                    questions.append(details)
                except:
                    print(f"  ⚠️  Could not parse details for {qid}")
        
        return questions, function_def_content
    
    def _log_batch_findings(self, gen_file: Path, findings: List[Dict[str, Any]], batch_idx: int, loop: int):
        """Log review findings for a batch to JSONL."""
        if INPUT_FILE_NAME:
            input_stem = Path(INPUT_FILE_NAME).stem
            log_file = self.review_dir / f"processed_{input_stem}_review.jsonl"
        else:
            log_file = self.review_dir / f"processed_{gen_file.stem}_review.jsonl"
        
        with open(log_file, 'a', encoding='utf-8') as f:
            f.write(json.dumps({
                "batch": batch_idx + 1,
                "loop": loop,
                "timestamp": datetime.now().isoformat(),
                "findings": findings
            }, ensure_ascii=False) + "\n")
    
    def _write_outputs(self, gen_file: Path, outputs: Dict[str, str], 
                      expected_logic: Dict[str, Dict[str, Any]],
                      failed_questions: List[Dict[str, Any]]):
        """Write final SPSS outputs and failure report (append mode for batches)."""
        # Generate output filename based on input filename
        if INPUT_FILE_NAME:
            # Use the input file name for output
            input_stem = Path(INPUT_FILE_NAME).stem
            output_file = self.output_dir / f'SPSS_output_{input_stem}.sps'
        else:
            # Use original logic for batch processing
            output_file = self.output_dir / f'SPSS_output_{gen_file.stem}.sps'
        
        # Check if file exists to determine if we need header
        file_exists = output_file.exists()
        
        mode = 'a' if file_exists else 'w'
        
        with open(output_file, mode, encoding='utf-8') as f:
            if not file_exists:
                # Write header only for new file
                f.write(f"* ============================================================.\n")
                f.write(f"* SPSS Validation Script (Multi-Agent Batched)\n")
                f.write(f"* Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
                f.write(f"* Source: {gen_file.name}\n")
                f.write(f"* Model: {self.model}\n")
                f.write(f"* ============================================================.\n\n")

            # Append passing outputs
            for qid, script in outputs.items():
                expected = expected_logic.get(qid, {})

                f.write(f"* ============================================================.\n")
                f.write(f"* Question ID: {qid}\n")
                f.write(f"* ============================================================.\n")
                f.write(f"*\n")
                f.write(f"* ORIGINAL QUESTION DETAILS:\n")
                f.write(f"* -----------------------------------------------------------\n")
                for line in json.dumps(expected, indent=2, ensure_ascii=False).split('\n'):
                    f.write(f"* {line}\n")
                f.write(f"* -----------------------------------------------------------\n\n")
                f.write(script)
                f.write("\n\n")

        print(f"\n✅ Output {'appended to' if file_exists else 'written to'}: {output_file}")
        print(f"  Passing questions in this write: {len(outputs)}")
        
        # Append failures to failure file
        if failed_questions:
            if INPUT_FILE_NAME:
                input_stem = Path(INPUT_FILE_NAME).stem
                failure_file = self.review_dir / f"processed_{input_stem}_failures.jsonl"
            else:
                failure_file = self.review_dir / f"processed_{gen_file.stem}_failures.jsonl"
            with open(failure_file, 'a', encoding='utf-8') as f:
                for failure in failed_questions:
                    f.write(json.dumps(failure, ensure_ascii=False) + "\n")
            print(f"  ⚠️  Failures appended to: {failure_file}")


async def main_async():
    """Async entry point."""
    load_dotenv()
    
    try:
        pipeline = AsyncMultiAgentPipeline()
        await pipeline.run_async()
    except KeyboardInterrupt:
        print("\n\n⚠️  Async Pipeline interrupted by user")
    except Exception as e:
        print(f"\n\n❌ Async Pipeline error: {e}")
        import traceback
        traceback.print_exc()


def main():
    """Entry point - runs async main."""
    asyncio.run(main_async())


if __name__ == "__main__":
    main()


