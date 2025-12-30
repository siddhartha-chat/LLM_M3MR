# Multi-Batch 2 Logic Flow Explanation

## 🏗️ Architecture Overview

The script implements a **parallel multi-agent batch processing system** with three main components:

1. **AsyncTransformerAgent** - Generates SPSS scripts from survey questions
2. **AsyncReviewerAgent** - Reviews generated scripts for correctness
3. **AsyncMultiAgentPipeline** - Orchestrates the parallel batch processing

---

## 📊 High-Level Execution Flow

```
main()
  └─> asyncio.run(main_async())
       └─> AsyncMultiAgentPipeline.run_async()
            ├─> Load training context
            ├─> Find generation files (*.md)
            └─> Process files (sequentially or in parallel)
                 └─> _process_file_async()
                      ├─> Parse questions from file
                      ├─> Split into batches
                      └─> Process batches in PARALLEL chunks
                           └─> _process_batch_async() [for each batch]
                                └─> Feedback loop (up to MAX_FEEDBACK_LOOPS)
```

---

## 🔄 Detailed Flow Breakdown

### **Phase 1: Initialization** (`main()` → `run_async()`)

1. **Startup Configuration**
   - Loads environment variables (batch size, model, rate limits, etc.)
   - Prints effective configuration
   - Initializes `SPSSBatchProcessor` from `main.py`

2. **Agent Initialization**
   - Creates `AsyncTransformerAgent` (uses `AsyncOpenAI` client)
   - Creates `AsyncReviewerAgent` (uses batch reviewer prompt)
   - Sets up learning memory manager (if enabled)

3. **Training Context Loading**
   - Loads training examples from `training/` directory
   - Calculates token estimates

---

### **Phase 2: File Processing** (`_process_file_async()`)

1. **Parse Generation File**
   - Reads `.md` file from `generation/` directory
   - Extracts questions from `## Sheet1` section
   - Extracts `function_def` section
   - Creates `expected_logic` dictionary (QID → question details)

2. **Batch Creation**
   - Splits questions into batches of size `BATCH_SIZE` (default: 10)
   - Calculates number of batches: `num_batches = ceil(total_questions / BATCH_SIZE)`
   - Creates training context per batch:
     - **Batch 0**: Full training context (or trimmed to `TRAINING_CONTEXT_FIRST_BATCH_CHARS`)
     - **Other batches**: Empty or trimmed context (based on `INCLUDE_TRAINING_IN_ALL`)

3. **Parallel Batch Processing**
   - Creates async tasks for all batches
   - Groups batches into **chunks** of `MAX_PARALLEL_BATCHES` (default: 10)
   - Processes chunks sequentially, but batches within chunk run **in parallel**
   - Uses `asyncio.gather()` to execute multiple batches concurrently

```
Example: 16 batches, MAX_PARALLEL_BATCHES=10
  Chunk 1: Batches 1-10  → Process in parallel ⚡
  Chunk 2: Batches 11-16 → Process in parallel ⚡
```

---

### **Phase 3: Batch Processing** (`_process_batch_async()`)

Each batch goes through a **feedback loop** (up to `MAX_FEEDBACK_LOOPS` = 7):

#### **Loop 0 (First Iteration)**

1. **Pre-Analysis (Optional)**
   - If `SKIP_PRE_ANALYSIS=false`:
     - `AsyncReviewerAgent.pre_analyze_questions_async()` analyzes questions
     - Curates relevant training examples (max `PRE_ANALYSIS_MAX_CHARS` chars)
     - Caches curated context for reuse
   - If skipped: uses full training context

2. **Generation**
   - `AsyncTransformerAgent.generate_batch_async()`:
     - Formats all questions in batch
     - Builds prompt with curated/full training context
     - Injects anti-patterns and chain-of-thought (if enabled)
     - Calls OpenAI API (async) with rate limiting
     - Parses output to extract SPSS scripts per question
   - Returns: `Dict[QID → SPSS_script]`

3. **Review**
   - `AsyncReviewerAgent.review_batch_async()`:
     - Reviews **ALL questions in batch in ONE API call** (batch review)
     - Compares generated scripts against expected logic
     - Returns findings: `List[Dict]` with `pass`, `root_causes`, `instructions`

4. **Result Collection**
   - Passing questions → added to `batch_outputs`
   - Failing questions → kept in `remaining_questions` for next loop

#### **Loop 1+ (Feedback Loops)**

1. **Learning Memory Integration**
   - Records failures in learning memory (question type → failure pattern)
   - Retrieves relevant lessons for question types

2. **Regeneration**
   - `AsyncTransformerAgent.regenerate_subset_async()`:
     - Takes only failed questions
     - Includes reviewer feedback (root causes + instructions)
     - Uses **progressive context reduction** (reduces training context in later loops)
     - Calls OpenAI API with feedback
     - Returns regenerated scripts

3. **Review Again**
   - Reviews regenerated scripts
   - Collects passing/failing results

4. **Loop Termination**
   - If all questions pass → return `batch_outputs`
   - If max loops reached → return passing + failed questions
   - Otherwise → continue to next loop

---

### **Phase 4: Rate Limiting & Concurrency Control**

**Global Rate Limiter** (`GlobalRateLimiter`):
- Uses `asyncio.Semaphore` to limit concurrent API calls (`MAX_CONCURRENT_REQUESTS` = 5)
- Implements dynamic delay adjustment based on error rates
- Adds random jitter to avoid "thundering herd" effect

**Flow:**
```
API Call Request
  └─> rate_limiter.acquire()  [waits if semaphore full]
       └─> Make API call
            └─> rate_limiter.release()
```

**Parallel Processing Control:**
- Batches processed in chunks of `MAX_PARALLEL_BATCHES`
- Within chunk: batches run concurrently
- Between chunks: sequential (waits for chunk to complete)

---

## 🎯 Key Features & Enhancements

### **1. Parallel Batch Processing**
- Multiple batches processed simultaneously
- Controlled concurrency via chunking
- Significantly faster than sequential processing

### **2. Batch Review Optimization**
- Reviews all questions in batch in **one API call** (not one-by-one)
- Reduces API calls from N to 1 per batch

### **3. Learning Memory**
- Tracks common failure patterns
- Records successful fixes
- Provides lessons for similar question types

### **4. Progressive Context Reduction**
- Reduces training context size in later feedback loops
- Focuses on relevant examples based on failures
- Saves tokens and improves speed

### **5. Smart Retries**
- Enhanced feedback with root causes and specific instructions
- Anti-patterns injection to avoid common mistakes
- Chain-of-thought reasoning (optional)

### **6. Pre-Analysis Caching**
- First batch: pre-analyzes and curates training context
- Cached curated context reused for subsequent batches
- Saves API calls and time

---

## 📈 Example Execution Flow

**Scenario:** File with 156 questions, BATCH_SIZE=10, MAX_PARALLEL_BATCHES=10

```
1. Parse file → 156 questions
2. Split into 16 batches (10 questions each)
3. Process in 2 chunks:
   
   Chunk 1 (Batches 1-10):
     Batch 1: Loop 0 → Generate → Review → 8 pass, 2 fail
              Loop 1 → Regenerate 2 → Review → 2 pass ✅
     Batch 2: Loop 0 → Generate → Review → 10 pass ✅
     ...
     Batch 10: [parallel processing]
   
   Chunk 2 (Batches 11-16):
     Batch 11-16: [parallel processing]

4. Collect all passing outputs
5. Write to output/SPSS_output_*.sps
```

**Total API Calls (approximate):**
- Pre-analysis: 1 per file (cached)
- Generation: 16 batches × ~1-2 loops = 16-32 calls
- Review: 16 batches × ~1-2 loops = 16-32 calls
- **Total: ~33-65 calls** (vs ~312+ for sequential one-by-one)

---

## 🔧 Configuration Points

**Key Environment Variables:**
- `BATCH_SIZE`: Questions per batch (default: 10)
- `MAX_PARALLEL_BATCHES`: Batches processed simultaneously (default: 10)
- `MAX_FEEDBACK_LOOPS`: Max retry loops per batch (default: 7)
- `MAX_CONCURRENT_REQUESTS`: Concurrent API calls (default: 5)
- `SKIP_PRE_ANALYSIS`: Skip pre-analysis for speed (default: false)
- `ENABLE_LEARNING_MEMORY`: Track failures/successes (default: true)

---

## 🎨 Data Structures

**Key Data Flow:**
```
questions: List[Dict] → Batch → Dict[QID, SPSS_script] → Review → List[Finding]
                                                                    ↓
                                                          {pass: bool, root_causes: [], instructions: []}
```

**Finding Structure:**
```python
{
    "question_id": "Q1",
    "pass": False,
    "root_causes": ["Missing entry condition check"],
    "instructions": ["Apply screener condition before validation"]
}
```

---

## 🚀 Performance Optimizations

1. **Parallel Processing**: 10x speedup for large files
2. **Batch Review**: Reduces API calls by ~90%
3. **Context Caching**: Reuses curated context across batches
4. **Progressive Reduction**: Saves tokens in later loops
5. **Smart Rate Limiting**: Adapts to API performance

---

## 📝 Output Files

1. **SPSS Scripts**: `output/SPSS_output_{filename}.sps`
2. **Review Reports**: `output/review_reports/processed_{filename}_batch_{N}_loop_{M}.jsonl`
3. **Learning Memory**: `learning_memory.json` (if enabled)

---

This architecture enables **fast, parallel, intelligent** processing of large survey question files with automatic error correction through multi-agent feedback loops.

