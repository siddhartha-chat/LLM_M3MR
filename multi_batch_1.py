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
import hashlib
from pathlib import Path
from dotenv import load_dotenv
from typing import List, Dict, Any, Tuple, Optional
from openai import AsyncOpenAI
from datetime import datetime
import traceback as tb
from collections import defaultdict

# Import from existing main.py
from main import SPSSBatchProcessor

# Load environment
load_dotenv()

# Configuration
BATCH_SIZE = int(os.getenv("MAX_QUESTIONS") or "10")  # Reuse MAX_QUESTIONS as batch size
MAX_FEEDBACK_LOOPS = int(os.getenv("MAX_FEEDBACK_LOOPS", "7"))
INCLUDE_TRAINING_IN_ALL = (os.getenv("INCLUDE_TRAINING_IN_ALL", "true").lower() == "true")
TRAINING_CONTEXT_FIRST_BATCH_CHARS = int(os.getenv("TRAINING_CONTEXT_FIRST_BATCH_CHARS") or "60000")
TRAINING_CONTEXT_OTHER_BATCH_CHARS = int(os.getenv("TRAINING_CONTEXT_OTHER_BATCH_CHARS") or "5000")
MAX_COMPLETION_TOKENS_TRANSFORMER = int(os.getenv("MAX_COMPLETION_TOKENS_TRANSFORMER") or "5000")
MAX_COMPLETION_TOKENS_REVIEWER = int(os.getenv("MAX_COMPLETION_TOKENS_REVIEWER") or "16000")
INPUT_FILE_NAME = os.getenv("INPUT_FILE_NAME", "")  # Specific file to process
SKIP_PRE_ANALYSIS = (os.getenv("SKIP_PRE_ANALYSIS", "false").lower() == "true")  # Skip pre-analysis for speed

# Rate limiting configuration
GLOBAL_RATE_LIMIT_DELAY = float(os.getenv("GLOBAL_RATE_LIMIT_DELAY", "0.1"))  # Delay between any API calls
MAX_CONCURRENT_REQUESTS = int(os.getenv("MAX_CONCURRENT_REQUESTS", "5"))  # Max concurrent API calls
MAX_PARALLEL_BATCHES = int(os.getenv("MAX_PARALLEL_BATCHES", "10"))  # Max batches to process in parallel

# Enhanced features configuration
PRE_ANALYSIS_MAX_CHARS = int(os.getenv("PRE_ANALYSIS_MAX_CHARS", "30000"))  # Limit pre-analysis output
ENABLE_LEARNING_MEMORY = (os.getenv("ENABLE_LEARNING_MEMORY", "true").lower() == "true")  # Learning across batches
LEARNING_MEMORY_PATH = Path("learning_memory.json")  # Path to learning memory file
ENABLE_SMART_RETRIES = (os.getenv("ENABLE_SMART_RETRIES", "true").lower() == "true")  # Smart retries with explanation
PROGRESSIVE_CONTEXT_REDUCTION = (os.getenv("PROGRESSIVE_CONTEXT_REDUCTION", "true").lower() == "true")  # Reduce context in later loops

# Debug: print effective environment configuration at startup
def _print_startup_config():
    cfg = {
        "MODEL": os.getenv("MODEL", ""),
        "BATCH_SIZE": BATCH_SIZE,
        "MAX_FEEDBACK_LOOPS": MAX_FEEDBACK_LOOPS,
        "INCLUDE_TRAINING_IN_ALL": INCLUDE_TRAINING_IN_ALL,
        "TRAINING_CONTEXT_FIRST_BATCH_CHARS": TRAINING_CONTEXT_FIRST_BATCH_CHARS,
        "TRAINING_CONTEXT_OTHER_BATCH_CHARS": TRAINING_CONTEXT_OTHER_BATCH_CHARS,
        "MAX_COMPLETION_TOKENS_TRANSFORMER": MAX_COMPLETION_TOKENS_TRANSFORMER,
        "MAX_COMPLETION_TOKENS_REVIEWER": MAX_COMPLETION_TOKENS_REVIEWER,
        "SKIP_PRE_ANALYSIS": SKIP_PRE_ANALYSIS,
        "GLOBAL_RATE_LIMIT_DELAY": GLOBAL_RATE_LIMIT_DELAY,
        "MAX_CONCURRENT_REQUESTS": MAX_CONCURRENT_REQUESTS,
        "MAX_PARALLEL_BATCHES": MAX_PARALLEL_BATCHES,
        "INPUT_FILE_NAME": INPUT_FILE_NAME,
        "--- ENHANCEMENTS ---": "",
        "PRE_ANALYSIS_MAX_CHARS": PRE_ANALYSIS_MAX_CHARS,
        "ENABLE_LEARNING_MEMORY": ENABLE_LEARNING_MEMORY,
        "ENABLE_SMART_RETRIES": ENABLE_SMART_RETRIES,
        "PROGRESSIVE_CONTEXT_REDUCTION": PROGRESSIVE_CONTEXT_REDUCTION,
    }
    print("\n================= EFFECTIVE ENV CONFIG (async parallel + enhanced) =================")
    for k, v in cfg.items():
        if k.startswith("---"):
            print(f"\n{k}")
        else:
            print(f"{k}: {v}")
    print("====================================================================================\n")

# Learning Memory Manager
class LearningMemoryManager:
    """Manages learning memory across batches to track common failures and fixes."""
    
    def __init__(self, memory_path: Path = LEARNING_MEMORY_PATH):
        self.memory_path = memory_path
        self.memory = self._load_memory()
        
    def _load_memory(self) -> Dict[str, Any]:
        """Load learning memory from file."""
        if not self.memory_path.exists():
            return {
                "common_failures": defaultdict(list),
                "successful_fixes": defaultdict(list),
                "anti_patterns": [],
                "learned_patterns": []
            }
        
        try:
            with open(self.memory_path, 'r', encoding='utf-8') as f:
                data = json.load(f)
                # Convert to defaultdict for easier access
                if "common_failures" in data:
                    data["common_failures"] = defaultdict(list, data["common_failures"])
                if "successful_fixes" in data:
                    data["successful_fixes"] = defaultdict(list, data["successful_fixes"])
                return data
        except Exception as e:
            print(f"⚠️  Could not load learning memory: {e}")
            return {
                "common_failures": defaultdict(list),
                "successful_fixes": defaultdict(list),
                "anti_patterns": [],
                "learned_patterns": []
            }
    
    def save_memory(self):
        """Save learning memory to file."""
        try:
            # Convert defaultdict to regular dict for JSON serialization
            save_data = {
                "common_failures": dict(self.memory["common_failures"]),
                "successful_fixes": dict(self.memory["successful_fixes"]),
                "anti_patterns": self.memory["anti_patterns"],
                "learned_patterns": self.memory["learned_patterns"]
            }
            with open(self.memory_path, 'w', encoding='utf-8') as f:
                json.dump(save_data, f, indent=2, ensure_ascii=False)
        except Exception as e:
            print(f"⚠️  Could not save learning memory: {e}")
    
    def record_failure(self, question_type: str, root_cause: str, instructions: str):
        """Record a failure pattern."""
        self.memory["common_failures"][question_type].append({
            "root_cause": root_cause,
            "instructions": instructions,
            "timestamp": datetime.now().isoformat()
        })
    
    def record_success(self, question_type: str, pattern: str, fix: str):
        """Record a successful fix."""
        self.memory["successful_fixes"][question_type].append({
            "pattern": pattern,
            "fix": fix,
            "timestamp": datetime.now().isoformat()
        })
    
    def get_relevant_lessons(self, question_types: List[str]) -> str:
        """Get relevant lessons for given question types."""
        lessons = []
        
        for qtype in question_types:
            if qtype in self.memory["common_failures"]:
                failures = self.memory["common_failures"][qtype]
                if failures:
                    lessons.append(f"\n=== Common Issues for {qtype} ===")
                    for failure in failures[-3:]:  # Last 3 failures
                        lessons.append(f"Issue: {failure['root_cause']}")
                        lessons.append(f"Fix: {failure['instructions']}\n")
        
        return "\n".join(lessons) if lessons else ""

# Helper functions for enhancements
def _organize_training_context(training_context: str) -> str:
    """Dynamically organize training context by question types."""
    # Simple heuristic-based organization
    sections = {
        "single_choice": [],
        "multi_choice": [],
        "hidden_derived": [],
        "special_codes": [],
        "other": []
    }
    
    # Split training context into examples
    examples = re.split(r'\n(?=Question ID:)', training_context)
    
    for example in examples:
        if not example.strip():
            continue
            
        # Classify example
        if "VariableType" in example and ("Hidden" in example or "Disabled" in example):
            sections["hidden_derived"].append(example)
        elif any(code in example for code in ["97", "98", "99"]):
            sections["special_codes"].append(example)
        elif "SelectType" in example and "multiple" in example.lower():
            sections["multi_choice"].append(example)
        elif "SelectType" in example:
            sections["single_choice"].append(example)
        else:
            sections["other"].append(example)
    
    # Rebuild organized context
    organized = []
    if sections["single_choice"]:
        organized.append("=== SINGLE CHOICE QUESTIONS ===\n" + "\n".join(sections["single_choice"][:5]))
    if sections["multi_choice"]:
        organized.append("\n=== MULTI-CHOICE QUESTIONS ===\n" + "\n".join(sections["multi_choice"][:5]))
    if sections["hidden_derived"]:
        organized.append("\n=== HIDDEN/DERIVED VARIABLES ===\n" + "\n".join(sections["hidden_derived"][:3]))
    if sections["special_codes"]:
        organized.append("\n=== SPECIAL CODE HANDLING (97,98,99) ===\n" + "\n".join(sections["special_codes"][:5]))
    
    return "\n".join(organized) if organized else training_context

def _get_anti_patterns() -> str:
    """Return anti-patterns section to inject into prompts."""
    return """
=== CRITICAL ANTI-PATTERNS (Learn from common mistakes) ===

❌ WRONG: Using range() for non-sequential codes
sel if ~range(Q1,1,5).
✅ CORRECT: Using any() with explicit codes
sel if ~any(Q1,1,2,3,4,5,97,98,99).
WHY: range() doesn't work for non-sequential answer codes

❌ WRONG: Missing special codes
sel if ~any(Q2,1,2,3).
✅ CORRECT: Include 97, 98, 99 if present in data
sel if ~any(Q2,1,2,3,97,98,99).
WHY: Special codes must be validated too

❌ WRONG: Not checking for Hidden/Derived variables
[Treats as regular validation question]
✅ CORRECT: Check VariableType='Hidden' and Disabled='true'
* This is a derived variable, no validation needed
WHY: Hidden/derived variables need computation logic, not validation

❌ WRONG: Not handling missing values first
sel if Q3 ne 1.
✅ CORRECT: Check miss() before value checks
sel if miss(Q3) or Q3 ne 1.
WHY: Must handle missing values to avoid errors

=== END ANTI-PATTERNS ===
"""

def _get_chain_of_thought_instructions() -> str:
    """Return Chain-of-Thought instructions to inject into prompts."""
    return """
=== THINK BEFORE YOU GENERATE ===

Before generating each SPSS script, analyze:

1. **Question Type**: Is this single choice, multi-choice, hidden/derived, or computed?
   - Check SelectType, VariableType, Disabled flags
   
2. **Validation Pattern**: What validation approach should I use?
   - Cite a similar training example
   - Match the pattern exactly
   
3. **Special Codes**: Are there special codes (97, 98, 99) to handle?
   - Check answer options
   - Include ALL codes in validation
   
4. **Hidden/Derived Check**: Is this a computed variable?
   - Look for VariableType='Hidden' + Disabled='true'
   - Look for computation keywords in labels ("based on", "calculated")
   
5. **SPSS Syntax**: Use correct syntax
   - tit, temporary., sel if, list, del var
   - any() for explicit codes, miss() for missing values

ONLY AFTER this analysis, generate the script.

=== END CHAIN-OF-THOUGHT ===
"""

# Global rate limiter
class GlobalRateLimiter:
    """Global rate limiter to coordinate API calls across all agents with dynamic adjustment."""
    
    def __init__(self, max_concurrent: int = MAX_CONCURRENT_REQUESTS, delay: float = GLOBAL_RATE_LIMIT_DELAY):
        self.base_delay = delay
        self.current_delay = delay
        self.semaphore = asyncio.Semaphore(max_concurrent)
        self.last_request_time = 0
        self.request_times = []  # Track recent request times for performance analysis
        self.error_count = 0
        self.success_count = 0
        self.min_delay = 0.1 # Minimum delay
        self.max_delay = 3  # Maximum delay
    
    async def acquire(self):
        await self.semaphore.acquire()
        current_time = time.time()
        time_since_last = current_time - self.last_request_time
        if time_since_last < self.current_delay:
            await asyncio.sleep(self.current_delay - time_since_last)
        self.last_request_time = time.time()
        self.request_times.append(current_time)
        
        # Keep only last 20 request times for analysis
        if len(self.request_times) > 20:
            self.request_times = self.request_times[-20:]
    
    def release(self):
        self.semaphore.release()
    
    def record_success(self):
        """Record a successful API call."""
        self.success_count += 1
        self._adjust_delay()
    
    def record_error(self):
        """Record an API error (429, timeout, etc.)."""
        self.error_count += 1
        self._adjust_delay()
    
    def _adjust_delay(self):
        """Dynamically adjust delay based on recent performance."""
        total_calls = self.success_count + self.error_count
        
        if total_calls < 5:  # Need some data before adjusting
            return
        
        error_rate = self.error_count / total_calls
        
        # Calculate average time between requests
        if len(self.request_times) >= 2:
            avg_gap = sum([self.request_times[i] - self.request_times[i-1] 
                          for i in range(1, len(self.request_times))]) / (len(self.request_times) - 1)
        else:
            avg_gap = self.current_delay
        
        # Adjust delay based on performance
        if error_rate > 0.1:  # High error rate - increase delay
            old_delay = self.current_delay
            self.current_delay = min(self.current_delay * 1.5, self.max_delay)
            if old_delay != self.current_delay:
                print(f"🔧 Rate limiter: High error rate ({error_rate:.1%}), increasing delay to {self.current_delay:.1f}s")
        elif error_rate < 0.05 and avg_gap > self.current_delay * 1.5:  # Low error rate and slow - decrease delay
            old_delay = self.current_delay
            self.current_delay = max(self.current_delay * 0.8, self.min_delay)
            if old_delay != self.current_delay:
                print(f"🔧 Rate limiter: Good performance, decreasing delay to {self.current_delay:.1f}s")
        elif avg_gap < self.current_delay * 0.8:  # Very fast - might be too aggressive
            old_delay = self.current_delay
            self.current_delay = min(self.current_delay * 1.2, self.max_delay)
            if old_delay != self.current_delay:
                print(f"🔧 Rate limiter: Very fast requests, increasing delay to {self.current_delay:.1f}s")
    
    def get_current_delay(self):
        """Get the current delay setting."""
        return self.current_delay
    
    def reset_stats(self):
        """Reset performance statistics."""
        self.error_count = 0
        self.success_count = 0
        self.request_times = []

# Global rate limiter instance
rate_limiter = GlobalRateLimiter()

# Global learning memory manager instance
learning_memory = LearningMemoryManager() if ENABLE_LEARNING_MEMORY else None

def _supports_temperature(model_name: str) -> bool:
    """Return True if the model supports the temperature parameter."""
    name = (model_name or "").lower()
    return not (name.startswith("o") or name.startswith("gpt-5"))


class AsyncTransformerAgent:
    """Generates SPSS validation scripts from survey question specifications (async)."""
    
    def __init__(self, processor: SPSSBatchProcessor):
        self.processor = processor
        self.client = AsyncOpenAI(api_key=os.getenv("OPENAI_API_KEY"))
        self.model = processor.model
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
                        "max_completion_tokens": max_tokens or MAX_COMPLETION_TOKENS_TRANSFORMER,
                    }
                    if temperature is not None and _supports_temperature(self.model):
                        completion_args["temperature"] = temperature
                    
                    response = await self.client.chat.completions.create(**completion_args)
                    rate_limiter.record_success()  # Record successful API call
                    return response.choices[0].message.content
                    
                finally:
                    rate_limiter.release()
                
            except Exception as e:
                if "429" in str(e) or "rate limit" in str(e).lower():
                    rate_limiter.record_error()  # Record rate limit error
                    if attempt == self.max_retries - 1:
                        print(f"    ❌ Rate limit exceeded after {self.max_retries} attempts")
                        raise e
                    continue
                else:
                    rate_limiter.record_error()  # Record other errors
                    raise e
        
        raise Exception("Max retries exceeded")
        
    async def generate_batch_async(self, questions: List[Dict[str, Any]], training_context: str, 
                                 function_def: str = "", batch_id: int = 0) -> Dict[str, str]:
        """Generate SPSS scripts for a batch of questions (async)."""
        print(f"\n🔄 [Batch {batch_id}] AsyncTransformerAgent: Generating scripts for {len(questions)} question(s)...")
        
        generation_template = self.processor.load_prompt_template('user', 'generation_prompt')
        system_prompt = self.processor.load_prompt_template('system', 'system_prompt')
        
        batch_content = "\n\n---\n\n".join([
            self._format_question(q) for q in questions
        ])
        
        # ENHANCEMENT: Organize training context by type
        organized_context = _organize_training_context(training_context)
        
        # ENHANCEMENT: Add learning memory lessons if available
        lessons = ""
        if learning_memory:
            question_types = [q.get('SelectType', 'unknown') for q in questions]
            lessons = learning_memory.get_relevant_lessons(question_types)
        
        # ENHANCEMENT: Inject anti-patterns and chain-of-thought
        enhanced_training = organized_context
        if lessons:
            enhanced_training += f"\n\n{lessons}"
        enhanced_training += f"\n\n{_get_anti_patterns()}"
        enhanced_training += f"\n\n{_get_chain_of_thought_instructions()}"
        
        user_prompt = generation_template.replace('{TRAINING_CONTEXT}', enhanced_training)
        user_prompt = user_prompt.replace('{BATCH_NUMBER}', '1')
        user_prompt = user_prompt.replace('{BATCH_CONTENT}', batch_content)
        user_prompt = user_prompt.replace('{FUNCTION_DEF}', function_def)
        
        try:
            # Add delay between requests to avoid rate limiting
            await asyncio.sleep(rate_limiter.get_current_delay())
            
            messages = [
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt},
            ]
            
            # Debug: Show prompt sizes
            system_len = len(system_prompt)
            user_len = len(user_prompt)
            training_ctx_len = len(training_context)
            total_input_chars = system_len + user_len
            est_input_tokens = total_input_chars // 4
            print(f"  📏 [Batch {batch_id}] Prompt size: system={system_len} chars, user={user_len} chars")
            print(f"  📏 [Batch {batch_id}] Training context size: {training_ctx_len} chars (~{training_ctx_len//4} tokens)")
            print(f"  📏 [Batch {batch_id}] Total input: ~{est_input_tokens} tokens, max output: {MAX_COMPLETION_TOKENS_TRANSFORMER} tokens")
            print(f"  ⏳ [Batch {batch_id}] Calling OpenAI API (model: {self.model})...")
            
            start_time = time.time()
            output = await self._make_api_call_with_retry(
                messages, 
                max_tokens=MAX_COMPLETION_TOKENS_TRANSFORMER,
                temperature=0.2
            )
            elapsed = time.time() - start_time
            
            print(f"  ✅ [Batch {batch_id}] API call completed in {elapsed:.1f}s. Response length: {len(output) if output else 0} chars")
            
            # Debug: check if output is empty
            if not output or not output.strip():
                print(f"  ⚠️  [Batch {batch_id}] WARNING: Model returned empty output!")
                print(f"  [Batch {batch_id}] This might indicate context overflow or model error")
            
            parsed_outputs = self._parse_output(output, questions)
            
            # Debug: show parsed script count
            print(f"  📊 [Batch {batch_id}] Parsed {len(parsed_outputs)} script(s) from model output")
            if parsed_outputs:
                qids = list(parsed_outputs.keys())
                print(f"  ✓ [Batch {batch_id}] Extracted scripts for QIDs: {qids}")
                # Show first script preview
                first_qid = qids[0]
                first_script = parsed_outputs[first_qid]
                print(f"  📝 [Batch {batch_id}] First script preview ({first_qid}, {len(first_script)} chars):")
                print(f"     {first_script[:200]}...")
            
            if len(parsed_outputs) == 0 and output and output.strip():
                print(f"  ⚠️  [Batch {batch_id}] Parser returned 0 scripts but model output is non-empty!")
                print(f"  [Batch {batch_id}] Output preview (first 1000 chars):")
                print(f"  {output[:1000]}")
                print(f"\n  [Batch {batch_id}] Checking for 'Question ID:' patterns in output...")
                qid_count = len(re.findall(r'Question ID:', output, re.IGNORECASE))
                print(f"  [Batch {batch_id}] Found {qid_count} 'Question ID:' occurrence(s)")
            
            return parsed_outputs
            
        except Exception as e:
            print(f"❌ [Batch {batch_id}] AsyncTransformerAgent error: {e}")
            print(f"  [Batch {batch_id}] Error type: {type(e).__name__}")
            import traceback
            traceback.print_exc()
            return {}
    
    async def regenerate_subset_async(self, failed_questions: List[Dict[str, Any]], 
                                    reviewer_feedback: List[Dict[str, Any]],
                                    training_context: str, function_def: str = "", batch_id: int = 0, 
                                    loop_num: int = 1) -> Dict[str, str]:
        """Regenerate SPSS scripts for failed questions with reviewer feedback (async).
        
        ENHANCEMENTS:
        - Progressive context reduction based on loop number
        - Smart retries with explanation
        - Learning memory integration
        """
        print(f"\n🔄 [Batch {batch_id}] AsyncTransformerAgent: Regenerating {len(failed_questions)} failed question(s)...")
        
        # Use dedicated regeneration prompt (more succinct)
        regeneration_template = self.processor.load_prompt_template('user', 'regeneration_prompt')
        system_prompt = self.processor.load_prompt_template('system', 'system_prompt')
        
        # Format failed questions
        batch_content = "\n\n---\n\n".join([
            self._format_question(q) for q in failed_questions
        ])
        
        # ENHANCEMENT: Format reviewer feedback with enhanced details including training references
        feedback_content = "\n\n".join([
            f"Question ID: {f.get('question_id', 'UNKNOWN')}\n"
            f"Root Causes:\n" + "\n".join(f"  - {cause}" for cause in f.get('root_causes', ['Unknown issue'])) + "\n"
            f"Specific Instructions:\n" + "\n".join(f"  - {inst}" for inst in f.get('instructions', ['Fix and regenerate']))
            for f in reviewer_feedback
        ])
        
        # ENHANCEMENT: Progressive context reduction
        reduced_context = training_context
        if PROGRESSIVE_CONTEXT_REDUCTION and loop_num > 1:
            # Extract only examples relevant to failed patterns
            context_limit = max(5000, 10000 // loop_num)  # Reduce more aggressively in later loops
            reduced_context = self._extract_relevant_context(training_context, reviewer_feedback, context_limit)
            print(f"  📉 [Batch {batch_id}] Loop {loop_num}: Reduced context to {len(reduced_context)} chars (from {len(training_context)})")
        
        # ENHANCEMENT: Organize and enhance context
        organized_context = _organize_training_context(reduced_context)
        enhanced_training = organized_context + f"\n\n{_get_anti_patterns()}"
        
        user_prompt = regeneration_template.replace('{TRAINING_CONTEXT}', enhanced_training)
        user_prompt = user_prompt.replace('{BATCH_CONTENT}', batch_content)
        user_prompt = user_prompt.replace('{FUNCTION_DEF}', function_def)
        user_prompt = user_prompt.replace('{REVIEWER_FEEDBACK}', feedback_content)
        
        try:
            # Add delay between requests to avoid rate limiting
            await asyncio.sleep(rate_limiter.get_current_delay())
            
            messages = [
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt},
            ]
            
            # Debug: Show prompt sizes
            system_len = len(system_prompt)
            user_len = len(user_prompt)
            training_ctx_len = len(training_context)
            total_input_chars = system_len + user_len
            est_input_tokens = total_input_chars // 4
            print(f"  📏 [Batch {batch_id}] Regeneration prompt: system={system_len} chars, user={user_len} chars")
            print(f"  📏 [Batch {batch_id}] Training context size: {training_ctx_len} chars (~{training_ctx_len//4} tokens)")
            print(f"  📏 [Batch {batch_id}] Total input: ~{est_input_tokens} tokens, max output: {MAX_COMPLETION_TOKENS_TRANSFORMER} tokens")
            print(f"  ⏳ [Batch {batch_id}] Calling OpenAI API for regeneration...")
            
            start_time = time.time()
            output = await self._make_api_call_with_retry(
                messages, 
                max_tokens=MAX_COMPLETION_TOKENS_TRANSFORMER,
                temperature=0.2
            )
            elapsed = time.time() - start_time
            
            print(f"  ✅ [Batch {batch_id}] Regeneration API call completed in {elapsed:.1f}s. Response length: {len(output) if output else 0} chars")
            
            parsed_outputs = self._parse_output(output, failed_questions)
            
            # Debug: show parsed script count
            print(f"  📊 [Batch {batch_id}] Parsed {len(parsed_outputs)} script(s) from regeneration output")
            if parsed_outputs:
                qids = list(parsed_outputs.keys())
                print(f"  ✓ [Batch {batch_id}] Regenerated scripts for QIDs: {qids}")
            
            if len(parsed_outputs) == 0 and output and output.strip():
                print(f"  ⚠️  [Batch {batch_id}] Parser returned 0 scripts but regeneration output is non-empty!")
                print(f"  [Batch {batch_id}] Output preview (first 1000 chars):")
                print(f"  {output[:1000]}")
                print(f"\n  [Batch {batch_id}] Checking for 'Question ID:' patterns in output...")
                qid_count = len(re.findall(r'Question ID:', output, re.IGNORECASE))
                print(f"  [Batch {batch_id}] Found {qid_count} 'Question ID:' occurrence(s)")
            
            return parsed_outputs
            
        except Exception as e:
            print(f"❌ [Batch {batch_id}] AsyncTransformerAgent regeneration error: {e}")
            return {}
    
    def _format_question(self, question: Dict[str, Any]) -> str:
        """Format a single question for the prompt."""
        return json.dumps(question, indent=2, ensure_ascii=False)
    
    def _extract_relevant_context(self, training_context: str, reviewer_feedback: List[Dict[str, Any]], 
                                   char_limit: int) -> str:
        """Extract only the most relevant examples from training context based on failures.
        
        ENHANCEMENT: Progressive context reduction for later feedback loops.
        """
        # Extract keywords from failures
        keywords = set()
        for feedback in reviewer_feedback:
            for cause in feedback.get('root_causes', []):
                # Extract key terms
                keywords.update(re.findall(r'\b\w{4,}\b', cause.lower()))
            for instruction in feedback.get('instructions', []):
                keywords.update(re.findall(r'\b\w{4,}\b', instruction.lower()))
        
        # Split training context into examples
        examples = re.split(r'\n(?=Question ID:)', training_context)
        
        # Score each example by keyword relevance
        scored_examples = []
        for example in examples:
            if not example.strip():
                continue
            score = sum(1 for keyword in keywords if keyword in example.lower())
            if score > 0:
                scored_examples.append((score, example))
        
        # Sort by relevance and take top examples within char limit
        scored_examples.sort(reverse=True, key=lambda x: x[0])
        
        relevant_context = []
        current_length = 0
        for score, example in scored_examples:
            if current_length + len(example) > char_limit:
                break
            relevant_context.append(example)
            current_length += len(example)
        
        return "\n\n".join(relevant_context) if relevant_context else training_context[:char_limit]
    
    def _parse_output(self, output: str, questions: List[Dict[str, Any]]) -> Dict[str, str]:
        """Parse the model output to extract individual question scripts.
        
        Handles multiple formats:
        1. Banner format with asterisks: * ============\n* Question ID: ...
        2. Plain format: Question ID:\nXYZ\ndetails_normalized:\n...\noutput_spss_script:\n...
        3. Any mix of the above
        """
        results = {}
        
        if not output or not output.strip():
            return results
        
        # Strategy 1: Try to split by any form of "Question ID:" marker
        # This handles both "Question ID:" and "* Question ID:"
        question_blocks = re.split(r'\n(?=(?:\*\s+)?Question ID:)', output)
        
        for block in question_blocks:
            block = block.strip()
            if not block:
                continue
            
            # Extract Question ID - very lenient pattern
            # Matches: "Question ID: ABC" or "* Question ID: ABC" or "Question ID:\nABC"
            qid_match = re.search(r'(?:\*\s*)?Question ID:\s*\n?([^\n]+)', block, re.IGNORECASE)
            if not qid_match:
                continue
                
            qid = qid_match.group(1).strip()
            
            # Strategy A: Try to extract just the SPSS script section
            # Look for "output_spss_script:" followed by content until next section or end
            script_match = re.search(
                r'output_spss_script:\s*\n+(.*?)(?=\n+(?:Question ID:|details_normalized:|\*\s+Question ID:|\*\s+=+|---|\Z))',
                block,
                re.DOTALL | re.IGNORECASE
            )
            
            if script_match:
                script_content = script_match.group(1).strip()
                if script_content:
                    results[qid] = script_content
                    continue
            
            # Strategy B: If no "output_spss_script:" marker, look for SPSS code patterns
            # (lines starting with SPSS commands like tit, compute, do repeat, etc.)
            spss_lines = []
            for line in block.split('\n'):
                line_stripped = line.strip()
                # Check if line looks like SPSS code
                if line_stripped and (
                    line_stripped.startswith(('tit ', 'compute ', 'do repeat', 'end repeat', 
                                             'temporary', 'sel if', 'list ', 'del var', 
                                             'if ', 'filter ', '* ', 'value labels'))
                    or '=' in line_stripped
                    or line_stripped.endswith('.')
                ):
                    spss_lines.append(line)
            
            if spss_lines:
                results[qid] = '\n'.join(spss_lines).strip()
                continue
            
            # Strategy C: Last resort - use entire block if it seems substantial
            if len(block) > 50:  # Arbitrary threshold
                results[qid] = block
        
        return results


class AsyncReviewerAgent:
    """Reviews generated SPSS scripts for logic correctness (async)."""
    
    def __init__(self, reviewer_prompt_path: Path, model: str):
        self.client = AsyncOpenAI(api_key=os.getenv("OPENAI_API_KEY"))
        self.model = model
        # Use batch reviewer prompt for reviewing multiple questions at once
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
                    rate_limiter.record_success()  # Record successful API call
                    return response.choices[0].message.content
                    
                finally:
                    rate_limiter.release()
                
            except Exception as e:
                if "429" in str(e) or "rate limit" in str(e).lower():
                    rate_limiter.record_error()  # Record rate limit error
                    if attempt == self.max_retries - 1:
                        print(f"    ❌ Rate limit exceeded after {self.max_retries} attempts")
                        raise e
                    continue
                else:
                    rate_limiter.record_error()  # Record other errors
                    raise e
        
        raise Exception("Max retries exceeded")
    
    async def pre_analyze_questions_async(self, questions: List[Dict[str, Any]], 
                                         training_context: str, batch_id: int = 0) -> str:
        """Pre-analyze questions and curate relevant training examples for transformer (async)."""
        print(f"\n🔍 [Batch {batch_id}] AsyncReviewerAgent: Pre-analyzing {len(questions)} question(s) to curate training examples...")
        print(f"  ⏰ [Batch {batch_id}] NOTE: This pre-analysis step may take 30-60 seconds...")
        
        analysis_prompt = f"""You are an expert SPSS script analyst. Your task is to analyze the given survey questions and identify ONLY the MOST RELEVANT examples and patterns from the training context.

CRITICAL: Keep your response concise and focused. Maximum length: {PRE_ANALYSIS_MAX_CHARS} characters.

Review the questions below and return a curated selection of:
1. The 5-10 MOST RELEVANT training examples that match the question types exactly
2. Key patterns and logic rules that apply to THESE specific questions
3. Common pitfalls to avoid for THESE question types
4. Specific guidance for THESE questions

REQUIREMENTS:
- Include ONLY examples that directly match the question patterns
- Exclude irrelevant examples and generic information
- Focus on quality over quantity
- Prioritize examples with similar validation patterns
- Keep total response under {PRE_ANALYSIS_MAX_CHARS} characters

Format your response as a focused training guide."""
        
        questions_content = "\n\n---\n\n".join([
            f"Question ID: {q.get('Question ID', 'UNKNOWN')}\n"
            f"Details: {json.dumps(q, indent=2, ensure_ascii=False)}"
            for q in questions
        ])
        
        user_content = f"""TRAINING CONTEXT:
{training_context}

\n\nQUESTIONS TO ANALYZE:
{questions_content}

\n\nBased on the above questions function definitions and training context, provide a curated training guide with the most relevant examples and guidance."""
        
        try:
            # Add delay between requests to avoid rate limiting
            await asyncio.sleep(rate_limiter.get_current_delay())
            
            messages = [
                {"role": "system", "content": analysis_prompt},
                {"role": "user", "content": user_content},
            ]
            
            # Debug: Show input size
            input_chars = len(analysis_prompt) + len(user_content)
            est_tokens = input_chars // 4
            print(f"  📏 [Batch {batch_id}] Pre-analysis input: ~{est_tokens} tokens, output limit: {MAX_COMPLETION_TOKENS_REVIEWER}")
            print(f"  ⏳ [Batch {batch_id}] Calling OpenAI API for pre-analysis...")
            
            start_time = time.time()
            curated_context = await self._make_api_call_with_retry(
                messages, 
                max_tokens=MAX_COMPLETION_TOKENS_REVIEWER,
                temperature=0.1
            )
            elapsed = time.time() - start_time
            
            # Enforce maximum size
            if len(curated_context) > PRE_ANALYSIS_MAX_CHARS:
                print(f"  ⚠️  [Batch {batch_id}] Pre-analysis output ({len(curated_context)} chars) exceeds limit, truncating to {PRE_ANALYSIS_MAX_CHARS}")
                curated_context = curated_context[:PRE_ANALYSIS_MAX_CHARS]
            
            print(f"  ✅ [Batch {batch_id}] Pre-analysis completed in {elapsed:.1f}s")
            print(f"  ✓ [Batch {batch_id}] Curated training context: {len(curated_context)} characters (~{len(curated_context)//4} tokens)")
            return curated_context
            
        except Exception as e:
            print(f"❌ [Batch {batch_id}] AsyncReviewerAgent pre-analysis error: {e}")
            print(f"  [Batch {batch_id}] Falling back to original training context")
            return training_context
    
    async def review_batch_async(self, expected_logic: Dict[str, Dict[str, Any]], 
                                outputs: Dict[str, str], training_context: str, batch_id: int = 0) -> List[Dict[str, Any]]:
        """Review generated SPSS scripts for logic correctness (async).
        
        NEW: Reviews ALL questions in a single API call instead of one-by-one.
        """
        print(f"\n🔍 [Batch {batch_id}] AsyncReviewerAgent: Reviewing {len(outputs)} generated script(s) in ONE API call...")
        
        if not outputs:
            return []
        
        # Check for empty scripts upfront
        findings = []
        valid_outputs = {}
        for qid, script in outputs.items():
            if not script or not script.strip():
                findings.append({
                    "question_id": qid,
                    "pass": False,
                    "root_causes": ["Empty or missing script"],
                    "instructions": ["Regenerate the script for this question"]
                })
            else:
                valid_outputs[qid] = script
        
        if not valid_outputs:
            return findings
        
        try:
            # Build a single prompt with ALL questions and scripts
            questions_and_scripts = []
            for qid, script in valid_outputs.items():
                question_block = f"""
---
Question ID: {qid}

Expected Logic:
{json.dumps(expected_logic.get(qid, {}), indent=2, ensure_ascii=False)}

Generated SPSS Script:
{script}
---
"""
                questions_and_scripts.append(question_block)
            
            combined_questions = "\n".join(questions_and_scripts)
            
            user_content = self.prompt_template.replace('{TRAINING_CONTEXT}', training_context[:5000] + "...\n\n")
            user_content = user_content.replace('{QUESTIONS_AND_SCRIPTS}', combined_questions)
                
            messages = [
                {"role": "system", "content": "You are an expert SPSS script reviewer. Analyze ALL generated scripts against their expected logic and provide detailed feedback for each."},
                    {"role": "user", "content": user_content},
                ]
            
            # Add delay before API call
            await asyncio.sleep(rate_limiter.get_current_delay())
            
            print(f"  📏 [Batch {batch_id}] Reviewing {len(valid_outputs)} questions in 1 API call (vs {len(valid_outputs)} calls previously)")
                
            review_content = await self._make_api_call_with_retry(
                    messages, 
                    max_tokens=MAX_COMPLETION_TOKENS_REVIEWER,
                    temperature=0.1
                )
                
            # Parse batch review results (expects JSON array)
            batch_findings = self._parse_batch_review_json(review_content, list(valid_outputs.keys()))
            findings.extend(batch_findings)
            
        except Exception as e:
            print(f"❌ [Batch {batch_id}] AsyncReviewerAgent batch review error: {e}")
            import traceback
            traceback.print_exc()
            # Fallback: mark all as failed
            for qid in valid_outputs.keys():
                findings.append({
                    "question_id": qid,
                    "pass": False,
                    "root_causes": [f"Batch review error: {str(e)}"],
                    "instructions": ["Fix the review error and retry"]
                })
        
        return findings
    
    def _parse_batch_review_json(self, review_content: str, expected_qids: List[str]) -> List[Dict[str, Any]]:
        """Parse the reviewer's batch JSON response (expects array of findings).
        
        NEW: Parses JSON array instead of single object.
        """
        try:
            # Extract JSON array from the response
            # Try to find array pattern first
            array_match = re.search(r'\[.*\]', review_content, re.DOTALL)
            if array_match:
                findings = json.loads(array_match.group(0))
                if isinstance(findings, list):
                    print(f"  ✅ Parsed {len(findings)} findings from batch review")
                    return findings
            
            # Fallback: try to extract individual objects and combine into array
            print(f"  ⚠️  No JSON array found, attempting to extract individual objects...")
            object_matches = re.finditer(r'\{[^}]*"question_id"[^}]*\}', review_content, re.DOTALL)
            findings = []
            for match in object_matches:
                try:
                    finding = json.loads(match.group(0))
                    findings.append(finding)
                except:
                    continue
            
            if findings:
                print(f"  ✅ Extracted {len(findings)} findings from individual objects")
                return findings
            
            # No valid JSON found
            print(f"  ⚠️  No valid JSON found in batch review response")
            print(f"  📄 Raw review content (first 1000 chars):")
            print(f"     {review_content[:1000]}")
            
        except Exception as e:
            print(f"  ⚠️  Could not parse batch review JSON: {e}")
            print(f"  📄 Raw review content (first 1000 chars):")
            print(f"     {review_content[:1000]}")
        
        # Fallback: create failed findings for all expected questions
        print(f"  ⚠️  Falling back: creating failed findings for all {len(expected_qids)} questions")
        return [
            {
                "question_id": qid,
                "pass": False,
                "root_causes": ["Could not parse batch review response"],
                "instructions": ["Review and regenerate"]
            }
            for qid in expected_qids
        ]
    
    def _parse_review_json(self, review_content: str, qid: str) -> Dict[str, Any]:
        """Parse the reviewer's JSON response (single question - kept for compatibility)."""
        try:
            # Extract JSON from the response
            json_match = re.search(r'\{.*\}', review_content, re.DOTALL)
            if json_match:
                return json.loads(json_match.group(0))
            else:
                # No JSON found - print what we got
                print(f"  ⚠️  No JSON found in review for {qid}")
                print(f"  📄 Raw review content (first 500 chars):")
                print(f"     {review_content[:500]}")
        except Exception as e:
            print(f"  ⚠️  Could not parse review JSON for {qid}: {e}")
            print(f"  📄 Raw review content (first 500 chars):")
            print(f"     {review_content[:500]}")
        
        # Fallback if JSON parsing fails
        return {
            "question_id": qid,
            "pass": False,
            "root_causes": ["Could not parse review response"],
            "instructions": ["Regenerate and review again"]
        }


class AsyncMultiAgentPipeline:
    """Orchestrates the AsyncTransformer + AsyncReviewer feedback loop with parallel batched processing."""
    
    def __init__(self):
        print("🚀 Initializing Async Multi-Agent Parallel Batch Pipeline (ENHANCED v2.0)...")
        self.processor = SPSSBatchProcessor()
        self.model = self.processor.model
        
        # Initialize agents
        self.transformer = AsyncTransformerAgent(self.processor)
        # Use NEW batch reviewer prompt for multi-question review
        self.reviewer = AsyncReviewerAgent(
            Path("prompts/reviewer/batch_reviewer_prompt.txt"), 
            self.model
        )
        
        print(f"  Model: {self.model}")
        print(f"  Batch size: {BATCH_SIZE} questions per batch")
        print(f"  Max feedback loops per batch: {MAX_FEEDBACK_LOOPS}")
        print(f"  Parallel processing: ENABLED (up to {MAX_PARALLEL_BATCHES} batches)")
        print(f"  Reviewer mode: BATCH (all questions in 1 API call)")
        print(f"\n  🎯 ENHANCEMENTS ENABLED:")
        print(f"    ✓ Selective pre-analysis (max {PRE_ANALYSIS_MAX_CHARS} chars)")
        print(f"    ✓ Anti-patterns injection")
        print(f"    ✓ Chain-of-thought reasoning")
        print(f"    ✓ Organized training context")
        if PROGRESSIVE_CONTEXT_REDUCTION:
            print(f"    ✓ Progressive context reduction")
        if ENABLE_LEARNING_MEMORY:
            print(f"    ✓ Learning memory ({LEARNING_MEMORY_PATH})")
        if ENABLE_SMART_RETRIES:
            print(f"    ✓ Smart retries with explanation")
    
    async def run_async(self):
        """Main execution loop (async)."""
        start_time = time.time()
        _print_startup_config()
        
        print("\n" + "="*80)
        print("ASYNC MULTI-AGENT SPSS SCRIPT GENERATION (PARALLEL BATCHES)")
        print("="*80)
        
        # Load training context
        print("\n📚 Loading training context...")
        training_context = self.processor.load_training_context()
        print(f"  Training context tokens: ~{len(training_context) // 4}")
        
        # Process files
        if INPUT_FILE_NAME:
            # Process specific file
            gen_file = Path("generation") / INPUT_FILE_NAME
            if gen_file.exists():
                await self._process_file_async(gen_file, training_context)
            else:
                print(f"❌ File not found: {gen_file}")
        else:
            # Process all files
            gen_files = list(Path("generation").glob("*.md"))
            if not gen_files:
                print("❌ No generation files found in generation/ directory")
                return
            
            print(f"📁 Found {len(gen_files)} generation file(s)")
            
            # Process all files in parallel
            tasks = [self._process_file_async(gen_file, training_context) for gen_file in gen_files]
            await asyncio.gather(*tasks, return_exceptions=True)
        
        elapsed = time.time() - start_time
        print("\n" + "="*80)
        print(f"✅ ASYNC PIPELINE COMPLETE in {elapsed:.1f}s")
        print("="*80)
    
    async def _process_file_async(self, gen_file: Path, training_context: str):
        """Process a single generation file through parallel batched feedback loop."""
        print("\n" + "="*80)
        print(f"ASYNC PROCESSING: {gen_file.name}")
        print("="*80)
        
        all_questions, function_def = self._parse_generation_file(gen_file)
        expected_logic = {q['Question ID']: q for q in all_questions}
        
        print(f"  Total questions in file: {len(all_questions)}")
        print(f"  Batch size: {BATCH_SIZE}")
        
        # Split into batches
        num_batches = (len(all_questions) + BATCH_SIZE - 1) // BATCH_SIZE
        print(f"  Number of batches: {num_batches}")
        
        # Process batches in PARALLEL (max 10 at a time) for optimal speed and rate limit control
        print(f"\n🚀 Starting PARALLEL processing of {num_batches} batches ({MAX_PARALLEL_BATCHES} at a time)...")
        
        all_passing_outputs = {}
        all_failed_questions = []
        
        # Create tasks for all batches
        tasks = []
        for batch_idx in range(num_batches):
            start_idx = batch_idx * BATCH_SIZE
            end_idx = min(start_idx + BATCH_SIZE, len(all_questions))
            batch_questions = all_questions[start_idx:end_idx]
            
            # Determine training context for this batch
            if batch_idx == 0:
                batch_training_context = training_context
            else:
                if INCLUDE_TRAINING_IN_ALL:
                    batch_training_context = training_context
                else:
                    batch_training_context = ""  # omit training for later batches
            
            # Create task for this batch
            task = self._process_batch_async(
                batch_questions, expected_logic, batch_training_context, 
                function_def, gen_file, batch_idx
            )
            tasks.append((batch_idx, task))
        
        # Process batches in chunks of MAX_PARALLEL_BATCHES
        num_chunks = (len(tasks) + MAX_PARALLEL_BATCHES - 1) // MAX_PARALLEL_BATCHES
        print(f"\n📊 Processing {len(tasks)} batches in {num_chunks} chunk(s) of up to {MAX_PARALLEL_BATCHES} batches each...")
        
        for chunk_idx in range(num_chunks):
            chunk_start = chunk_idx * MAX_PARALLEL_BATCHES
            chunk_end = min(chunk_start + MAX_PARALLEL_BATCHES, len(tasks))
            chunk_tasks = tasks[chunk_start:chunk_end]
            
            print(f"\n⚡ Launching chunk {chunk_idx + 1}/{num_chunks}: batches {chunk_start + 1}-{chunk_end} ({len(chunk_tasks)} batches in parallel)...")
            
            # Process this chunk in parallel
            chunk_results = await asyncio.gather(*[t[1] for t in chunk_tasks], return_exceptions=True)
            
            # Collect results from this chunk
            for idx, (batch_idx, _) in enumerate(chunk_tasks):
                result = chunk_results[idx]
                
                if isinstance(result, Exception):
                    print(f"❌ Batch {batch_idx + 1} failed with error: {result}")
                    import traceback
                    traceback.print_exception(type(result), result, result.__traceback__)
                    continue
                
                try:
                    passing_outputs, failed_questions = result
                    all_passing_outputs.update(passing_outputs)
                    all_failed_questions.extend(failed_questions)
                    
                    print(f"✅ Batch {batch_idx + 1}/{num_batches} completed: {len(passing_outputs)} passed")
                except Exception as e:
                    print(f"❌ Batch {batch_idx + 1} failed to unpack results: {e}")
                    continue
            
            print(f"✅ Chunk {chunk_idx + 1}/{num_chunks} complete ({len(chunk_tasks)} batches processed)")
        
        # Write outputs
        self._write_outputs(gen_file, all_passing_outputs)
        
        print(f"\n================================================================================\n"
              f"ASYNC FILE PROCESSING COMPLETE: {gen_file.name}\n"
              f"  Total questions processed: {len(all_passing_outputs)}/{len(all_questions)}\n"
              f"  Total failures: {len(all_failed_questions)}\n"
              f"================================================================================\n")
        
        return {
            "file": gen_file.name,
            "questions_processed": len(all_passing_outputs),
            "failures": len(all_failed_questions),
            "outputs": all_passing_outputs
        }
    
    async def _process_batch_async(self, batch_questions: List[Dict[str, Any]], 
                                  expected_logic: Dict[str, Dict[str, Any]], 
                                  training_context: str, function_def: str, 
                                  gen_file: Path, batch_idx: int) -> Tuple[Dict[str, str], List[Dict[str, Any]]]:
        """Process a single batch through the async feedback loop."""
        batch_outputs = {}
        remaining_questions = batch_questions.copy()
        
        # NEW: Reviewer pre-analysis on first loop to curate training context
        curated_training_context = None
        
        for loop in range(MAX_FEEDBACK_LOOPS):
            print(f"\n  🔄 Async Loop {loop + 1}/{MAX_FEEDBACK_LOOPS} (Batch {batch_idx + 1})")
            
            if loop == 0:
                # Check if we should skip pre-analysis for speed
                if SKIP_PRE_ANALYSIS:
                    print(f"  ⚡ [Batch {batch_idx + 1}] Skipping pre-analysis (SKIP_PRE_ANALYSIS=true)")
                    curated_training_context = training_context
                else:
                    # Call reviewer first to curate training examples
                    curated_training_context = await self.reviewer.pre_analyze_questions_async(
                        remaining_questions, training_context, batch_id=batch_idx + 1
                    )
                
                # Now generate with curated (or original) context
                outputs = await self.transformer.generate_batch_async(
                    remaining_questions, curated_training_context, function_def, batch_id=batch_idx + 1
                )
                # Fallback: if model returned empty for this loop, retry once with smaller context
                if len(outputs) == 0 and curated_training_context:
                    print("    🔁 Empty output detected; retrying once with reduced curated context (2000 chars)...")
                    reduced_ctx = curated_training_context[:2000]
                    outputs = await self.transformer.generate_batch_async(
                        remaining_questions, reduced_ctx, function_def, batch_id=batch_idx + 1
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
                
                # ENHANCEMENT: Record failures in learning memory
                if learning_memory:
                    for feedback in failed_feedback:
                        qid = feedback.get('question_id', 'UNKNOWN')
                        question = next((q for q in remaining_questions if q.get('Question ID') == qid), {})
                        qtype = question.get('SelectType', 'unknown')
                        for cause, instruction in zip(feedback.get('root_causes', []), feedback.get('instructions', [])):
                            learning_memory.record_failure(qtype, cause, instruction)
                
                # Use curated context for regeneration if available
                context_to_use = curated_training_context if curated_training_context else training_context
                # ENHANCEMENT: Pass loop number for progressive context reduction
                outputs = await self.transformer.regenerate_subset_async(
                    remaining_questions, failed_feedback, context_to_use, function_def, 
                    batch_id=batch_idx + 1, loop_num=loop
                )
            
            # Debug: Check what's being sent to reviewer
            print(f"\n    [DEBUG FLOW] [Batch {batch_idx + 1}] About to send to reviewer:")
            print(f"    - Outputs dict has {len(outputs)} entries")
            if outputs:
                print(f"    - QIDs in outputs: {list(outputs.keys())}")
                for qid, script in outputs.items():
                    print(f"    - {qid}: script length = {len(script)} chars")
            else:
                print(f"    - ⚠️  WARNING: outputs dict is EMPTY! Reviewer will receive nothing.")
            
            findings = await self.reviewer.review_batch_async(expected_logic, outputs, training_context, batch_id=batch_idx + 1)
            
            # Debug: Check what reviewer returned
            print(f"\n    [DEBUG FLOW] [Batch {batch_idx + 1}] Reviewer returned:")
            print(f"    - Findings list has {len(findings)} entries")
            if findings:
                passed = [f for f in findings if f.get('pass', False)]
                failed = [f for f in findings if not f.get('pass', False)]
                print(f"    - Passed: {len(passed)} questions: {[f.get('question_id') for f in passed]}")
                print(f"    - Failed: {len(failed)} questions: {[f.get('question_id') for f in failed]}")
            else:
                print(f"    - ⚠️  WARNING: findings list is EMPTY!")
            
            # Log findings for this batch
            self._log_batch_findings(gen_file, findings, batch_idx, loop)
            
            # Collect passing outputs
            for finding in findings:
                qid = finding['question_id']
                if finding['pass'] and qid in outputs:
                    batch_outputs[qid] = outputs[qid]
                    # ENHANCEMENT: Record success in learning memory
                    if learning_memory and loop > 0:  # Only record if it passed after regeneration
                        question = next((q for q in batch_questions if q.get('Question ID') == qid), {})
                        qtype = question.get('SelectType', 'unknown')
                        learning_memory.record_success(qtype, "Regeneration succeeded", f"Fixed after loop {loop}")
            
            failed = [f for f in findings if not f['pass']]
            if not failed:
                print(f"    ✅ All {len(findings)} questions passed!")
                # ENHANCEMENT: Save learning memory
                if learning_memory:
                    learning_memory.save_memory()
                    print(f"    💾 Learning memory saved to {LEARNING_MEMORY_PATH}")
                return batch_outputs, []
            
            # Update remaining questions for next loop
            remaining_questions = [q for q in remaining_questions if q['Question ID'] in [f['question_id'] for f in failed]]
        
        # Log final results
        failed_questions = [f for f in findings if not f['pass']]
        print(f"    📊 Batch {batch_idx + 1} complete: {len(batch_outputs)} passed, {len(failed_questions)} failed")
        
        # ENHANCEMENT: Save learning memory after each batch
        if learning_memory:
            learning_memory.save_memory()
            print(f"    💾 Learning memory saved to {LEARNING_MEMORY_PATH}")
        
        return batch_outputs, failed_questions
    
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
                    print(f"  ⚠️  Could not parse question {qid}")
                    continue
        
        return questions, function_def_content
    
    def _write_outputs(self, gen_file: Path, outputs: Dict[str, str]):
        """Write generated SPSS scripts to output file."""
        output_file = Path("output") / f"SPSS_output_{gen_file.stem}.sps"
        
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(f"* ============================================================.\n")
            f.write(f"* SPSS Validation Script (Multi-Agent Batched)\n")
            f.write(f"* Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write(f"* Source: {gen_file.name}\n")
            f.write(f"* Model: {self.model}\n")
            f.write(f"* ============================================================.\n\n")
            
            for qid, script in outputs.items():
                f.write(f"* ============================================================.\n")
                f.write(f"* Question ID: {qid}\n")
                f.write(f"* ============================================================.\n")
                f.write(f"*\n")
                f.write(f"* ORIGINAL QUESTION DETAILS:\n")
                f.write(f"* -----------------------------------------------------------\n")
                f.write(f"* {json.dumps({qid: 'details'}, indent=2)}\n")
                f.write(f"* -----------------------------------------------------------\n\n")
                f.write(f"{script}\n\n")
        
        print(f"✅ Output written to: {output_file}")
        print(f"  Passing questions in this write: {len(outputs)}")
    
    def _log_batch_findings(self, gen_file: Path, findings: List[Dict[str, Any]], batch_idx: int, loop: int):
        """Log batch findings for debugging."""
        log_file = Path("output/review_reports") / f"processed_{gen_file.stem}_batch_{batch_idx}_loop_{loop}.jsonl"
        log_file.parent.mkdir(exist_ok=True)
        
        with open(log_file, 'a', encoding='utf-8') as f:
            for finding in findings:
                f.write(json.dumps(finding, ensure_ascii=False) + '\n')


async def main_async():
    """Main async function."""
    pipeline = AsyncMultiAgentPipeline()
    await pipeline.run_async()


def main():
    """Main function."""
    asyncio.run(main_async())


if __name__ == "__main__":
    main()