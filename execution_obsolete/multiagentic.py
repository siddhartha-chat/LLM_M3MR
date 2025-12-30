#!/usr/bin/env python3
"""
Multi-Agent SPSS Script Generation with Transformer + Reviewer feedback loop.

This module implements a two-agent architecture:
- TransformerAgent: Generates SPSS scripts from survey questions
- ReviewerAgent: Reviews outputs for logic correctness and provides targeted feedback
- MultiAgentPipeline: Orchestrates the feedback loop until all questions pass or max loops reached
"""

import os
import json
import time
import re
from pathlib import Path
from dotenv import load_dotenv
from typing import List, Dict, Any, Tuple
from openai import OpenAI
from datetime import datetime

# Import from existing main.py
from main import SPSSBatchProcessor

# Load environment
load_dotenv()

# Configuration
MAX_FEEDBACK_LOOPS = int(os.getenv("MAX_FEEDBACK_LOOPS", "5"))
MAX_QUESTIONS = int(os.getenv("MAX_QUESTIONS") or "0")  # 0 means process all questions


def _supports_temperature(model_name: str) -> bool:
    """Return True if the model supports the temperature parameter."""
    name = (model_name or "").lower()
    return not (name.startswith("o") or name.startswith("gpt-5"))


class TransformerAgent:
    """Generates SPSS validation scripts from survey question specifications."""
    
    def __init__(self, processor: SPSSBatchProcessor):
        self.processor = processor
        self.client = processor.client
        self.model = processor.model
        
    def generate_batch(self, questions: List[Dict[str, Any]], training_context: str, 
                      function_def: str = "") -> Dict[str, str]:
        """Generate SPSS scripts for a batch of questions."""
        print(f"\n🔄 TransformerAgent: Generating scripts for {len(questions)} question(s)...")
        
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
            completion_args = {
                "model": self.model,
                "messages": [
                    {"role": "system", "content": system_prompt},
                    {"role": "user", "content": user_prompt},
                ],
                "max_completion_tokens": 10000,
            }
            if _supports_temperature(self.model):
                completion_args["temperature"] = 0.2
            response = self.client.chat.completions.create(**completion_args)
            
            output = response.choices[0].message.content
            
            # Debug: show output preview
            print(f"  [DEBUG] Transformer output preview (first 500 chars):")
            print(f"  {output[:500] if output else 'EMPTY'}...")
            
            return self._parse_output(output, questions)
            
        except Exception as e:
            print(f"❌ TransformerAgent error: {e}")
            import traceback
            print(f"  Full traceback:")
            traceback.print_exc()
            return {}
    
    def regenerate_subset(self, failed_questions: List[Dict[str, Any]], 
                         reviewer_feedback: List[Dict[str, Any]],
                         training_context: str,
                         function_def: str = "") -> Dict[str, str]:
        """Regenerate SPSS scripts ONLY for failed questions with reviewer feedback."""
        print(f"\n🔁 TransformerAgent: Regenerating {len(failed_questions)} failed question(s)...")
        
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
                "max_completion_tokens": 10000,
            }
            if _supports_temperature(self.model):
                completion_args["temperature"] = 0.2
            response = self.client.chat.completions.create(**completion_args)
            
            output = response.choices[0].message.content
            return self._parse_output(output, failed_questions)
            
        except Exception as e:
            print(f"❌ TransformerAgent regeneration error: {e}")
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


class ReviewerAgent:
    """Reviews generated SPSS scripts for logic correctness."""
    
    def __init__(self, client: OpenAI, reviewer_prompt_path: Path, model: str):
        self.client = client
        self.model = model
        self.prompt_template = reviewer_prompt_path.read_text(encoding='utf-8')
    
    def review_batch(self, expected_logic: Dict[str, Dict[str, Any]],
                    transformer_output: Dict[str, str],
                    training_context: str) -> List[Dict[str, Any]]:
        """Review transformer outputs against expected logic."""
        print(f"\n🔍 ReviewerAgent: Reviewing {len(transformer_output)} output(s)...")
        
        review_content = self.prompt_template + "\n\n"
        review_content += "=" * 80 + "\n"
        review_content += "TRAINING_CONTEXT\n"
        review_content += "=" * 80 + "\n"
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
                "max_completion_tokens": 18000,
            }
            if _supports_temperature(self.model):
                completion_args["temperature"] = 0.1
            response = self.client.chat.completions.create(**completion_args)
            
            output = response.choices[0].message.content
            findings = self._parse_review_json(output)
            
            passed = sum(1 for f in findings if f['pass'])
            failed = len(findings) - passed
            print(f"  ✓ Review complete: {passed} passed, {failed} failed")
            
            return findings
            
        except Exception as e:
            print(f"❌ ReviewerAgent error: {e}")
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


class MultiAgentPipeline:
    """Orchestrates the Transformer + Reviewer feedback loop."""
    
    def __init__(self):
        print("🚀 Initializing Multi-Agent Pipeline...")
        self.processor = SPSSBatchProcessor()
        self.client = self.processor.client
        self.model = self.processor.model
        
        self.transformer = TransformerAgent(self.processor)
        
        reviewer_prompt_path = Path("prompts/reviewer/reviewer_prompt.txt")
        self.reviewer = ReviewerAgent(self.client, reviewer_prompt_path, self.model)
        
        self.output_dir = Path("output")
        self.review_dir = self.output_dir / "review_reports"
        self.review_dir.mkdir(parents=True, exist_ok=True)
        
        print(f"  Model: {self.model}")
        print(f"  Max feedback loops: {MAX_FEEDBACK_LOOPS}")
        if MAX_QUESTIONS > 0:
            print(f"  ⚠️  Testing mode: Limited to {MAX_QUESTIONS} questions per file")
    
    def run(self):
        """Main execution loop."""
        start_time = time.time()
        
        print("\n" + "="*80)
        print("MULTI-AGENT SPSS SCRIPT GENERATION")
        print("="*80)
        
        print("\n📚 Loading training context...")
        max_ctx_tokens = int(os.getenv("TRAINING_CONTEXT_MAX_TOKENS") or "80000")
        training_context = self.processor.load_training_context(max_tokens=max_ctx_tokens)
        
        generation_files = self.processor.get_generation_files()
        print(f"\n📋 Found {len(generation_files)} file(s) to process")
        
        for gen_file in generation_files:
            self._process_file(gen_file, training_context)
        
        elapsed = time.time() - start_time
        print("\n" + "="*80)
        print(f"✅ PIPELINE COMPLETE in {elapsed:.1f}s")
        print("="*80)
    
    def _process_file(self, gen_file: Path, training_context: str):
        """Process a single generation file through the feedback loop."""
        print("\n" + "="*80)
        print(f"PROCESSING: {gen_file.name}")
        print("="*80)
        
        questions, function_def = self._parse_generation_file(gen_file)
        
        if MAX_QUESTIONS > 0 and len(questions) > MAX_QUESTIONS:
            print(f"  📊 Limiting to first {MAX_QUESTIONS} questions (MAX_QUESTIONS={MAX_QUESTIONS})")
            questions = questions[:MAX_QUESTIONS]
        
        expected_logic = {q['Question ID']: q for q in questions}
        
        print(f"  Total questions to process: {len(questions)}")
        
        all_outputs = {}
        remaining_questions = questions.copy()
        
        for loop in range(MAX_FEEDBACK_LOOPS):
            print(f"\n🔄 Loop {loop + 1}/{MAX_FEEDBACK_LOOPS}")
            
            if loop == 0:
                outputs = self.transformer.generate_batch(
                    remaining_questions, training_context, function_def
                )
            else:
                failed_feedback = [f for f in findings if not f['pass']]
                outputs = self.transformer.regenerate_subset(
                    remaining_questions, failed_feedback, training_context, function_def
                )
            
            findings = self.reviewer.review_batch(expected_logic, outputs, training_context)
            
            self._log_findings(gen_file, findings, loop)
            
            for finding in findings:
                qid = finding['question_id']
                if finding['pass'] and qid in outputs:
                    all_outputs[qid] = outputs[qid]
            
            failed = [f for f in findings if not f['pass']]
            if not failed:
                print(f"  ✅ All {len(findings)} questions passed!")
                break
            
            failed_qids = {f['question_id'] for f in failed}
            remaining_questions = [q for q in questions if q['Question ID'] in failed_qids]
            
            print(f"  ⚠️  {len(failed)} question(s) still failing, will retry...")
            
            if loop == MAX_FEEDBACK_LOOPS - 1:
                print(f"  ⚠️  Reached max loops, stopping with {len(failed)} failures")
        
        self._write_outputs(gen_file, all_outputs, expected_logic, findings)
    
    def _parse_generation_file(self, gen_file: Path) -> Tuple[List[Dict[str, Any]], str]:
        """Parse generation markdown file into question list."""
        with open(gen_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        sheet1_match = re.search(r'## Sheet1\n(.*?)(?=## function_def|$)', content, re.DOTALL)
        function_def_match = re.search(r'## function_def\n(.*?)$', content, re.DOTALL)
        
        sheet1_content = sheet1_match.group(1) if sheet1_match else ""
        function_def_content = function_def_match.group(1) if function_def_match else ""
        
        question_blocks = re.split(r'(?=Question ID:)', sheet1_content)
        questions = []
        
        for block in question_blocks:
            if not block.strip() or 'Question ID:' not in block:
                continue
            
            qid_match = re.search(r'Question ID:\s*\n([^\n]+)', block)
            if not qid_match:
                continue
            qid = qid_match.group(1).strip()
            
            details_match = re.search(r'details_normalized:\s*\n(.*?)(?=\n\noutput_spss_script:|\noutput_spss_script:)', block, re.DOTALL)
            if details_match:
                try:
                    details_str = details_match.group(1).strip()
                    details = eval(details_str)
                    questions.append(details)
                except:
                    print(f"  ⚠️  Could not parse details for {qid}")
        
        return questions, function_def_content
    
    def _log_findings(self, gen_file: Path, findings: List[Dict[str, Any]], loop: int):
        """Log review findings to JSONL."""
        log_file = self.review_dir / f"processed_{gen_file.stem}_review.jsonl"
        
        with open(log_file, 'a', encoding='utf-8') as f:
            f.write(json.dumps({
                "loop": loop,
                "timestamp": datetime.now().isoformat(),
                "findings": findings
            }, ensure_ascii=False) + "\n")
    
    def _write_outputs(self, gen_file: Path, outputs: Dict[str, str], 
                      expected_logic: Dict[str, Dict[str, Any]],
                      final_findings: List[Dict[str, Any]]):
        """Write final SPSS outputs and failure report."""
        output_file = self.output_dir / f'SPSS_output_{gen_file.stem}.sps'
        
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(f"* ============================================================.\n")
            f.write(f"* SPSS Validation Script (Multi-Agent Generated)\n")
            f.write(f"* Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write(f"* Source: {gen_file.name}\n")
            f.write(f"* Model: {self.model}\n")
            f.write(f"* ============================================================.\n\n")

            # Write all accumulated passing outputs (not just final loop)
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

            f.write(f"* ============================================================.\n")
            f.write(f"* End of Script - Total Questions Processed: {len(outputs)}\n")
            f.write(f"* ============================================================.\n")
        
        print(f"\n✅ Output written: {output_file}")
        print(f"  Passing questions: {len(outputs)}/{len(expected_logic)}")
        
        failing = [f for f in final_findings if not f['pass']]
        if failing:
            failure_file = self.review_dir / f"processed_{gen_file.stem}_failures.json"
            with open(failure_file, 'w', encoding='utf-8') as f:
                json.dump(failing, f, indent=2, ensure_ascii=False)
            print(f"  ⚠️  Failure report: {failure_file}")


def main():
    """Entry point."""
    load_dotenv()
    
    try:
        pipeline = MultiAgentPipeline()
        pipeline.run()
    except KeyboardInterrupt:
        print("\n\n⚠️  Pipeline interrupted by user")
    except Exception as e:
        print(f"\n\n❌ Pipeline error: {e}")
        import traceback
        traceback.print_exc()


if __name__ == "__main__":
    main()

