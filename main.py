import os
import json
import time
from openai import OpenAI
from typing import List, Dict, Tuple
import re
from pathlib import Path
from dotenv import load_dotenv
from datetime import datetime, timedelta

class SPSSBatchProcessor:
    def __init__(self, api_key: str = None, model: str = None, batch_size: int = None, max_batches: int = None, 
                 include_training_in_all: bool = None):
        """Initialize the batch processor with OpenAI API key."""
        load_dotenv()
        self.api_key = api_key or os.getenv('OPENAI_API_KEY')
        if not self.api_key:
            raise ValueError("OpenAI API key not found. Set it in .env file or pass it directly.")
        
        self.client = OpenAI(api_key=self.api_key)
        
        # Batch control settings
        self.batch_size = batch_size or int(os.getenv('BATCH_SIZE', '5'))  # Questions per batch
        self.max_batches = max_batches or (int(os.getenv('MAX_BATCHES')) if os.getenv('MAX_BATCHES') else None)  # Limit number of batches (None = no limit)
        
        # Training context optimization
        # If False (default), only first batch gets full training context
        # If True, all batches get full training context (uses more tokens but may improve quality)
        if include_training_in_all is None:
            env_value = os.getenv('INCLUDE_TRAINING_IN_ALL', 'false').lower()
            self.include_training_in_all = env_value in ('true', '1', 'yes')
        else:
            self.include_training_in_all = include_training_in_all
        
        # Model selection - can be overridden via env or parameter
        self.model = model or os.getenv('MODEL', 'gpt-4o-mini')  # Default to mini
        
        # Setup directory structure
        self.base_dir = Path('.')
        self.training_dir = self.base_dir / 'training'
        self.macros_dir = self.base_dir / 'macros'
        self.generation_dir = self.base_dir / 'generation'
        self.prompts_dir = self.base_dir / 'prompts'
        self.output_dir = self.base_dir / 'output'
        self.batch_output_dir = self.output_dir / 'batch_outputs'
        
        # Timing and statistics
        self.timing = {}
        self.token_stats = {
            'input_tokens': 0,
            'output_tokens': 0,
            'total_cost': 0.0
        }
        
    def start_timer(self, activity: str):
        """Start timing an activity."""
        self.timing[activity] = {'start': time.time()}
    
    def end_timer(self, activity: str):
        """End timing an activity."""
        if activity in self.timing:
            self.timing[activity]['end'] = time.time()
            self.timing[activity]['duration'] = self.timing[activity]['end'] - self.timing[activity]['start']
    
    def print_timing_summary(self):
        """Print summary of all timed activities."""
        print("\n" + "="*60)
        print("⏱️  TIMING SUMMARY")
        print("="*60)
        
        total_time = 0
        for activity, times in self.timing.items():
            if 'duration' in times:
                duration = times['duration']
                total_time += duration
                
                # Format duration
                if duration < 60:
                    duration_str = f"{duration:.1f}s"
                else:
                    mins = int(duration // 60)
                    secs = int(duration % 60)
                    duration_str = f"{mins}m {secs}s"
                
                print(f"  {activity}: {duration_str}")
        
        # Total time
        if total_time < 60:
            total_str = f"{total_time:.1f}s"
        else:
            mins = int(total_time // 60)
            secs = int(total_time % 60)
            total_str = f"{mins}m {secs}s"
        
        print(f"\n  Total Time: {total_str}")
    
    def calculate_costs(self):
        """Calculate costs based on model and tokens."""
        # Pricing per 1M tokens (Batch API - 50% off)
        pricing = {
            'gpt-4o': {'input': 2.50, 'output': 10.00},
            'gpt-4o-mini': {'input': 0.15, 'output': 0.60},
            'gpt-4-turbo': {'input': 5.00, 'output': 15.00}
        }
        
        model_pricing = pricing.get(self.model, pricing['gpt-4o-mini'])
        
        input_cost = (self.token_stats['input_tokens'] / 1_000_000) * model_pricing['input']
        output_cost = (self.token_stats['output_tokens'] / 1_000_000) * model_pricing['output']
        
        self.token_stats['total_cost'] = input_cost + output_cost
    
    def print_token_summary(self):
        """Print summary of token usage and costs."""
        self.calculate_costs()
        
        print("\n" + "="*60)
        print("💰 TOKEN USAGE & COST SUMMARY")
        print("="*60)
        print(f"  Model: {self.model}")
        print(f"  Input Tokens: {self.token_stats['input_tokens']:,}")
        print(f"  Output Tokens: {self.token_stats['output_tokens']:,}")
        
        if 'reasoning_tokens' in self.token_stats and self.token_stats['reasoning_tokens'] > 0:
            print(f"  Reasoning Tokens: {self.token_stats['reasoning_tokens']:,}")
        
        print(f"  Total Tokens: {self.token_stats['input_tokens'] + self.token_stats['output_tokens']:,}")
        print(f"\n  Estimated Cost: ${self.token_stats['total_cost']:.4f}")
        print(f"  (Batch API pricing - 50% discount)")
    
    def load_prompt_template(self, prompt_type: str, template_name: str) -> str:
        """Load prompt template from file."""
        prompt_path = self.prompts_dir / prompt_type / f"{template_name}.txt"
        
        if not prompt_path.exists():
            raise FileNotFoundError(f"Prompt template not found: {prompt_path}")
        
        with open(prompt_path, 'r', encoding='utf-8') as f:
            return f.read()
    
    def get_training_files(self) -> List[Path]:
        """Get all markdown files from training directory."""
        if not self.training_dir.exists():
            raise FileNotFoundError(f"Training directory not found: {self.training_dir}")
        
        md_files = list(self.training_dir.glob('*.md'))
        if not md_files:
            raise FileNotFoundError(f"No .md files found in {self.training_dir}")
        
        return md_files
    
    def get_macro_file(self) -> Path:
        """Get macro.txt file from macros directory."""
        macro_file = self.macros_dir / 'macro.txt'
        
        if not macro_file.exists():
            raise FileNotFoundError(f"Macro file not found: {macro_file}")
        
        return macro_file
    
    def get_generation_files(self) -> List[Path]:
        """Get all markdown files from generation directory."""
        if not self.generation_dir.exists():
            raise FileNotFoundError(f"Generation directory not found: {self.generation_dir}")
        
        md_files = list(self.generation_dir.glob('*.md'))
        if not md_files:
            raise FileNotFoundError(f"No .md files found in {self.generation_dir}")
        
        return md_files
    
    def load_training_context(self, max_tokens: int = 80000) -> str:
        """Load and prepare training context to be included in generation prompts."""
        # Read training files
        training_files = self.get_training_files()
        training_content = []
        
        for md_file in training_files:
            with open(md_file, 'r', encoding='utf-8') as f:
                content = f.read()
                training_content.append(f"=== Training Example: {md_file.name} ===\n{content}")
        
        combined_training = "\n\n".join(training_content)
        
        # Read macro file
        macro_file = self.get_macro_file()
        with open(macro_file, 'r', encoding='utf-8') as f:
            macro_content = f.read()
        
        # Combine into training context
        training_context = f"""
=== TRAINING EXAMPLES ===
{combined_training}

=== MACROS ===
{macro_content}
"""
        
        # Estimate tokens
        estimated_tokens = len(training_context) // 4
        print(f"  Training context tokens: ~{estimated_tokens:,}")
        
        # REMOVED: Auto-reduction logic - user wants full training context
        # The pre-analysis step will curate the context instead
        
        # Print only the first 1000 characters of the training context for preview
        preview_len = 1000
        preview = training_context[:preview_len] + ('...' if len(training_context) > preview_len else '')
        print(f"  Training context preview:\n{preview}")    
        return training_context
    
    def prepare_generation_batches(self, md_file: Path, training_context: str, include_training_in_all: bool = False) -> List[str]:
        """Parse the generation MD file and create batches with training context.
        
        Args:
            md_file: Path to generation markdown file
            training_context: Training examples and macros
            include_training_in_all: If True, include training in all batches. 
                                    If False (default), only include in first batch.
        """
        with open(md_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Load generation prompt template
        generation_template = self.load_prompt_template('user', 'generation_prompt')
        
        # Extract Sheet1 and function_def sections
        sheet1_match = re.search(r'## Sheet1\n(.*?)(?=## function_def|$)', content, re.DOTALL)
        function_def_match = re.search(r'## function_def\n(.*?)$', content, re.DOTALL)
        
        sheet1_content = sheet1_match.group(1) if sheet1_match else ""
        function_def_content = function_def_match.group(1) if function_def_match else ""
        
        # Split questions by "Question ID:" marker
        questions = re.split(r'(?=Question ID:)', sheet1_content)
        questions = [q.strip() for q in questions if q.strip()]
        
        print(f"  Total questions found: {len(questions)}")
        
        # Estimate token savings
        training_tokens = len(training_context) // 4
        print(f"  Training context: ~{training_tokens:,} tokens")
        if not include_training_in_all:
            print(f"  💡 Optimization: Training context included ONLY in first batch")
            print(f"  💰 Token savings per batch: ~{training_tokens:,} tokens")
        
        # Create batches
        batches = []
        batch_count = 0
        for i in range(0, len(questions), self.batch_size):
            # Check if we've reached the max batch limit
            if self.max_batches is not None and batch_count >= self.max_batches:
                print(f"  ⚠️  Reached max batch limit ({self.max_batches}). Stopping batch creation.")
                print(f"  Processing {batch_count * self.batch_size} out of {len(questions)} questions.")
                break
            
            batch = questions[i:i + self.batch_size]
            batch_content = "\n\n---\n\n".join(batch)
            
            # Decide whether to include training context
            is_first_batch = (batch_count == 0)
            use_training = include_training_in_all or is_first_batch
            
            if use_training:
                # Include full training context
                batch_prompt = generation_template.replace('{TRAINING_CONTEXT}', training_context)
                if is_first_batch and not include_training_in_all:
                    print(f"  ✅ Batch 1: Including training context (~{training_tokens:,} tokens)")
            else:
                # Remove training context placeholder with a reference
                training_reference = (
                    "=== TRAINING CONTEXT ===\n"
                    "Please refer to the training examples and patterns provided in Batch 1.\n"
                    "Continue using the same SPSS script generation approach.\n"
                )
                batch_prompt = generation_template.replace('{TRAINING_CONTEXT}', training_reference)
                if batch_count == 1:
                    print(f"  📝 Batches 2+: Using training reference only (saves ~{training_tokens:,} tokens/batch)")
            
            batch_prompt = batch_prompt.replace('{BATCH_NUMBER}', str(i//self.batch_size + 1))
            batch_prompt = batch_prompt.replace('{BATCH_CONTENT}', batch_content)
            batch_prompt = batch_prompt.replace('{FUNCTION_DEF}', function_def_content)
            
            batches.append(batch_prompt)
            batch_count += 1
        
        return batches
    
    def create_batch_input_file(self, prompts: List[str], file_path: Path, max_completion_tokens: int = 6000):
        """Create JSONL file for batch API."""
        # Load system prompt
        system_prompt = self.load_prompt_template('system', 'system_prompt')
        
        print(f"  Using model: {self.model}")
        print(f"  Max completion tokens: {max_completion_tokens}")
        
        # For reasoning models (o1, o3, gpt-5), we need more tokens
        if any(model in self.model.lower() for model in ['o1', 'o3', 'gpt-5']):
            print(f"  ⚠️  Reasoning model detected - increasing max_tokens to handle reasoning overhead")
            max_completion_tokens = max(max_completion_tokens, 000)
        
        with open(file_path, 'w', encoding='utf-8') as f:
            for idx, prompt in enumerate(prompts):
                request = {
                    "custom_id": f"request-{idx+1}",
                    "method": "POST",
                    "url": "/v1/chat/completions",
                    "body": {
                        "model": self.model,
                        "messages": [
                            {"role": "system", "content": system_prompt},
                            {"role": "user", "content": prompt}
                        ],
                        "max_completion_tokens": max_completion_tokens
                    }
                }
                f.write(json.dumps(request) + '\n')
        
        print(f"  Created batch input with {len(prompts)} request(s)")
        print(f"  Final max_tokens: {max_completion_tokens}")
    
    def upload_and_create_batch(self, input_file_path: Path) -> str:
        """Upload the batch file and create a batch job."""
        # Check file size
        file_size = input_file_path.stat().st_size
        file_size_mb = file_size / (1024 * 1024)
        print(f"  Batch file size: {file_size_mb:.2f} MB")
        
        # Upload the file
        print(f"\n📤 Uploading to OpenAI...")
        with open(input_file_path, 'rb') as f:
            batch_input_file = self.client.files.create(
                file=f,
                purpose="batch"
            )
        
        print(f"✓ File uploaded: {batch_input_file.id}")
        
        # Create the batch
        batch = self.client.batches.create(
            input_file_id=batch_input_file.id,
            endpoint="/v1/chat/completions",
            completion_window="24h",
            metadata={
                "description": "SPSS script generation batch"
            }
        )
        
        print(f"✓ Batch created: {batch.id}")
        print(f"  Status: {batch.status}")
        
        return batch.id
    
    def check_batch_status(self, batch_id: str) -> Dict:
        """Check the status of a batch job."""
        batch = self.client.batches.retrieve(batch_id)
        return {
            "id": batch.id,
            "status": batch.status,
            "created_at": batch.created_at,
            "completed_at": batch.completed_at,
            "failed_at": batch.failed_at,
            "request_counts": batch.request_counts
        }
    
    def wait_for_batch_completion(self, batch_id: str, poll_interval: int = 60):
        """Wait for batch to complete with periodic status checks."""
        print(f"\n⏳ Waiting for batch {batch_id} to complete...")
        
        while True:
            status = self.check_batch_status(batch_id)
            counts = status['request_counts']
            
            # Access attributes directly
            completed = getattr(counts, 'completed', 0)
            failed = getattr(counts, 'failed', 0)
            total = getattr(counts, 'total', 0)
            
            print(f"  Status: {status['status']} | Completed: {completed} | Failed: {failed} | Total: {total}")
            
            if status['status'] in ['completed', 'failed', 'expired', 'cancelled']:
                if status['status'] == 'failed':
                    self.print_batch_errors(batch_id)
                return status
            
            time.sleep(poll_interval)
    
    def print_batch_errors(self, batch_id: str):
        """Print error details if batch failed."""
        try:
            batch = self.client.batches.retrieve(batch_id)
            print(f"\n❌ Batch Error Details:")
            print(f"  Status: {batch.status}")
            print(f"  Errors: {batch.errors}")
        except Exception as e:
            print(f"  Could not retrieve error details: {e}")
    
    def download_batch_results(self, batch_id: str, output_file_path: Path) -> Tuple[List[Dict], Dict]:
        """Download and save batch results, return results and usage stats."""
        batch = self.client.batches.retrieve(batch_id)
        
        if batch.status != 'completed':
            raise Exception(f"Batch not completed. Status: {batch.status}")
        
        # Check if there are any successful results
        if batch.request_counts.completed == 0:
            print(f"\n⚠️  Warning: No requests completed successfully")
            
            if batch.error_file_id:
                error_content = self.client.files.content(batch.error_file_id)
                error_file = self.batch_output_dir / f'batch_{batch_id}_errors.jsonl'
                error_file.parent.mkdir(parents=True, exist_ok=True)
                
                with open(error_file, 'wb') as f:
                    f.write(error_content.content)
                
                print(f"   Error file saved to: {error_file}")
            
            raise Exception("All batch requests failed.")
        
        # Download the output file
        if not batch.output_file_id:
            raise Exception("Batch completed but no output file available")
        
        result_file_id = batch.output_file_id
        result = self.client.files.content(result_file_id)
        
        # Save to file
        output_file_path.parent.mkdir(parents=True, exist_ok=True)
        with open(output_file_path, 'wb') as f:
            f.write(result.content)
        
        print(f"✓ Results saved to: {output_file_path}")
        
        # Parse results and collect usage stats
        return self.parse_batch_results(output_file_path)
    
    def parse_batch_results(self, result_file_path: Path) -> Tuple[List[Dict], Dict]:
        """Parse the JSONL results file and extract usage statistics."""
        results = []
        total_input_tokens = 0
        total_output_tokens = 0
        total_reasoning_tokens = 0
        empty_responses = 0
        
        with open(result_file_path, 'r', encoding='utf-8') as f:
            for line in f:
                result = json.loads(line)
                
                # Extract content
                response_body = result.get('response', {}).get('body', {})
                content = response_body.get('choices', [{}])[0].get('message', {}).get('content', '')
                finish_reason = response_body.get('choices', [{}])[0].get('finish_reason', '')
                
                # Track empty responses due to length limits
                if not content or not content.strip():
                    empty_responses += 1
                    if finish_reason == 'length':
                        print(f"  ⚠️  {result['custom_id']}: Empty response (hit token limit)")
                
                results.append({
                    'custom_id': result['custom_id'],
                    'response': content,
                    'finish_reason': finish_reason
                })
                
                # Extract usage statistics
                usage = response_body.get('usage', {})
                total_input_tokens += usage.get('prompt_tokens', 0)
                total_output_tokens += usage.get('completion_tokens', 0)
                
                # Track reasoning tokens if available (for o1/o3/gpt-5 models)
                completion_details = usage.get('completion_tokens_details', {})
                total_reasoning_tokens += completion_details.get('reasoning_tokens', 0)
        
        if empty_responses > 0:
            print(f"\n  ⚠️  WARNING: {empty_responses} batch(es) returned empty responses")
            print(f"     This usually means the model hit the token limit during reasoning")
            print(f"     Consider increasing max_tokens or reducing batch size")
        
        if total_reasoning_tokens > 0:
            print(f"\n  ℹ️  Model used {total_reasoning_tokens:,} reasoning tokens")
        
        usage_stats = {
            'input_tokens': total_input_tokens,
            'output_tokens': total_output_tokens,
            'reasoning_tokens': total_reasoning_tokens
        }
        
        return results, usage_stats
    
    def process_generation(self, generation_file: Path, training_context: str) -> List[Dict]:
        """Process the generation phase in batches."""
        self.start_timer(f"Generation - {generation_file.name}")
        self.batch_output_dir.mkdir(parents=True, exist_ok=True)
        
        print("\n" + "="*60)
        print(f"PROCESSING: {generation_file.name}")
        print("="*60)
        
        # Prepare generation batches WITH training context
        self.start_timer("Preparing batches")
        batches = self.prepare_generation_batches(generation_file, training_context, self.include_training_in_all)
        print(f"✓ Created {len(batches)} batch(es) of questions")
        self.end_timer("Preparing batches")
        
        # Create batch input file with appropriate completion tokens for model type
        input_file = self.batch_output_dir / f'generation_{generation_file.stem}_input.jsonl'
        print(f"\n📝 Creating batch input file...")
        self.create_batch_input_file(batches, input_file, max_completion_tokens=10000)
        
        # Upload and create batch
        print(f"\n☁️  Uploading to OpenAI...")
        batch_id = self.upload_and_create_batch(input_file)
        
        # Wait for completion
        self.start_timer("Batch processing")
        status = self.wait_for_batch_completion(batch_id)
        self.end_timer("Batch processing")
        
        if status['status'] == 'completed':
            # Download results
            output_file = self.batch_output_dir / f'generation_{generation_file.stem}_output.jsonl'
            results, usage_stats = self.download_batch_results(batch_id, output_file)
            
            # Update token statistics
            self.token_stats['input_tokens'] += usage_stats['input_tokens']
            self.token_stats['output_tokens'] += usage_stats['output_tokens']
            if 'reasoning_tokens' in usage_stats:
                self.token_stats['reasoning_tokens'] = self.token_stats.get('reasoning_tokens', 0) + usage_stats['reasoning_tokens']
            
            # Save final results in SPS format
            final_output = self.output_dir / f'processed_{generation_file.stem}.sps'
            total_questions = self.save_sps_output(results, final_output, generation_file)
            
            print("\n" + "="*60)
            print("✅ GENERATION COMPLETE")
            print("="*60)
            print(f"  Processed {len(results)} batch(es)")
            print(f"  Extracted {total_questions} question(s)")
            print(f"  Output saved to: {final_output}")
            
            self.end_timer(f"Generation - {generation_file.name}")
            return results
        else:
            raise Exception(f"Generation batch failed with status: {status['status']}")
    
    def save_sps_output(self, results: List[Dict], output_path: Path, original_file: Path):
        """Save results in SPSS .sps format with only Question ID and script."""
        output_path.parent.mkdir(parents=True, exist_ok=True)
        
        print(f"\n📝 Parsing and formatting {len(results)} batch result(s)...")
        
        with open(output_path, 'w', encoding='utf-8') as f:
            # Write header
            f.write(f"* ============================================================.\n")
            f.write(f"* SPSS Validation Script\n")
            f.write(f"* Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write(f"* Source: {original_file.name}\n")
            f.write(f"* Model: {self.model}\n")
            f.write(f"* ============================================================.\n\n")
            
            total_questions = 0
            
            # Process each batch result
            for idx, result in enumerate(results):
                print(f"  Processing batch {idx + 1}/{len(results)}...")
                response = result['response']
                
                if not response or not response.strip():
                    print(f"    ⚠️  Warning: Empty response for batch {idx + 1}")
                    continue
                
                # Split by "Question ID:" to find individual questions
                # Use a more robust pattern
                question_blocks = re.split(r'\n(?=Question ID:)', response)
                
                for block in question_blocks:
                    if not block.strip() or 'Question ID:' not in block:
                        continue
                    
                    # Extract Question ID
                    qid_match = re.search(r'Question ID:\s*\n?([^\n]+)', block)
                    if not qid_match:
                        continue
                    
                    question_id = qid_match.group(1).strip()
                    
                    # Extract output_spss_script
                    # Look for the script section - it comes after "output_spss_script:"
                    script_match = re.search(
                        r'output_spss_script:\s*\n(.*?)(?=\n\nQuestion ID:|\n\n---|\Z)', 
                        block, 
                        re.DOTALL
                    )
                    
                    if not script_match:
                        # Try alternative pattern without extra newlines
                        script_match = re.search(
                            r'output_spss_script:\s*\n(.*?)(?=Question ID:|\Z)', 
                            block, 
                            re.DOTALL
                        )
                    
                    # Extract details_normalized (for reference)
                    details_match = re.search(
                        r'details_normalized:\s*\n(.*?)(?=\n\noutput_spss_script:|\noutput_spss_script:)', 
                        block, 
                        re.DOTALL
                    )
                    details_normalized = details_match.group(1).strip() if details_match else None
                    
                    if script_match:
                        script = script_match.group(1).strip()
                        
                        # Skip if script is empty or just contains the details_normalized
                        if not script or len(script) < 10:
                            print(f"    ⚠️  Warning: No script found for {question_id}")
                            continue
                        
                        # Write to SPS file
                        f.write(f"* ============================================================.\n")
                        f.write(f"* Question ID: {question_id}\n")
                        f.write(f"* ============================================================.\n")
                        
                        # Include details_normalized as a comment block for reference
                        if details_normalized:
                            f.write(f"*\n")
                            f.write(f"* ORIGINAL QUESTION DETAILS:\n")
                            f.write(f"* -----------------------------------------------------------\n")
                            # Split details into lines and add comment marker
                            for line in details_normalized.split('\n'):
                                f.write(f"* {line}\n")
                            f.write(f"* -----------------------------------------------------------\n")
                        
                        f.write(f"\n")
                        
                        # Replace <br> with actual line breaks if present
                        script = script.replace('<br>', '\n')
                        
                        f.write(script)
                        f.write("\n\n")
                        
                        total_questions += 1
                    else:
                        print(f"    ⚠️  Warning: Could not extract script for {question_id}")
            
            # Write footer
            f.write(f"* ============================================================.\n")
            f.write(f"* End of Script - Total Questions Processed: {total_questions}\n")
            f.write(f"* ============================================================.\n")
        
        print(f"✓ SPS file created with {total_questions} question(s)")
        
        if total_questions == 0:
            print(f"\n⚠️  WARNING: No questions were extracted!")
            print(f"   This might indicate a parsing issue.")
            print(f"   Check the raw output at: {self.batch_output_dir / f'generation_{original_file.stem}_output.jsonl'}")
            print(f"\n   Debugging: Showing first batch response preview...")
            if results:
                print(f"   Response preview (first 500 chars):")
                print(f"   {results[0]['response'][:500]}")
        
        return total_questions


def main():
    """Main execution function."""
    
    start_time = time.time()
    
    print("\n" + "="*60)
    print("SPSS SCRIPT GENERATION - BATCH PROCESSOR")
    print("="*60)
    
    try:
        # Initialize processor
        processor = SPSSBatchProcessor()
        
        # Display batch control settings
        print(f"\n⚙️  Batch Control Settings:")
        print(f"  - Questions per batch: {processor.batch_size}")
        if processor.max_batches:
            print(f"  - Max batches to process: {processor.max_batches}")
            print(f"  - Max questions to process: {processor.max_batches * processor.batch_size}")
        else:
            print(f"  - Max batches to process: Unlimited (will process all)")
        print(f"  - Model: {processor.model}")
        print(f"  - Training in all batches: {processor.include_training_in_all}")
        if not processor.include_training_in_all:
            print(f"    💡 Optimization enabled: Training context only in first batch")
        
        # Load training context once (to be reused in all generation prompts)
        print("\n" + "="*60)
        print("LOADING TRAINING CONTEXT")
        print("="*60)
        
        print("\n📚 Loading training data...")
        training_files = processor.get_training_files()
        print(f"  Found {len(training_files)} training file(s):")
        for f in training_files:
            print(f"    - {f.name}")
        
        processor.start_timer("Loading training context")
        training_context = processor.load_training_context()
        processor.end_timer("Loading training context")
        print(f"✓ Training context loaded and ready")
        
        # Process all generation files
        generation_files = processor.get_generation_files()
        
        print(f"\n\n📋 Found {len(generation_files)} file(s) to process:")
        for f in generation_files:
            print(f"  - {f.name}")
        
        for gen_file in generation_files:
            generation_results = processor.process_generation(gen_file, training_context)
        
        # Print summaries
        processor.print_timing_summary()
        processor.print_token_summary()
        
        print("\n" + "="*60)
        print("✅ ALL PROCESSING COMPLETE!")
        print("="*60)
        print(f"\nCheck the following directories:")
        print(f"  - {processor.output_dir}/*.sps for SPSS script files")
        print(f"  - {processor.batch_output_dir}/ for raw batch results")
        
    except FileNotFoundError as e:
        print(f"\n❌ Error: {str(e)}")
        print("\n💡 Make sure your project structure is set up correctly:")
        print("   project/")
        print("   ├── training/      (contains .md files)")
        print("   ├── macros/        (contains macro.txt)")
        print("   ├── generation/    (contains .md files to process)")
        print("   └── prompts/")
        print("       ├── system/    (contains system_prompt.txt)")
        print("       └── user/      (contains generation_prompt.txt)")
        
    except Exception as e:
        print(f"\n❌ Error: {str(e)}")
        import traceback
        traceback.print_exc()


if __name__ == "__main__":
    main()