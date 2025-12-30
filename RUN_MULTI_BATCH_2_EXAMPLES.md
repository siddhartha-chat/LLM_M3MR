# How to Run multi_batch_2.py - Complete Examples

This guide provides practical examples for running `multi_batch_2.py` with different configurations.

## 📋 Prerequisites

1. **Virtual environment activated**
2. **`.env` file configured** with your OpenAI API key
3. **Generation files** in the `generation/` directory

---

## 🚀 Quick Start Examples

### **Example 1: Basic Run (Process All Files)**

```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
python multi_batch_2.py
```

This will:
- Process all `.md` files in the `generation/` directory
- Use default settings (10 questions per batch, 7 feedback loops)
- Use `gpt-4o-mini` model (default)

---

### **Example 2: Process Specific File**

**Option A: Using environment variable**
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
export INPUT_FILE_NAME="R79641.md"
python multi_batch_2.py
```

**Option B: Set in `.env` file**
```bash
# Add to .env file:
INPUT_FILE_NAME=R79641.md
```

Then run:
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
python multi_batch_2.py
```

---

### **Example 3: With Sleep Prevention (Recommended for Long Runs)**

```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
caffeinate -i -w python multi_batch_2.py
```

This prevents your Mac from sleeping during the process.

---

### **Example 4: Background Run (Can Close Terminal)**

```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
nohup caffeinate -i python multi_batch_2.py > multi_batch_2.log 2>&1 &
```

**Check progress:**
```bash
tail -f multi_batch_2.log
```

**Stop the process:**
```bash
pkill -f multi_batch_2.py
```

---

## ⚙️ Configuration Examples

### **Example 5: Quick Test Run (Small Batch)**

Create or edit `.env` file:
```bash
OPENAI_API_KEY=your_api_key_here
MODEL=gpt-4o-mini
MAX_QUESTIONS=5          # Process only 5 questions
MAX_FEEDBACK_LOOPS=3    # Fewer feedback loops for speed
SKIP_PRE_ANALYSIS=true  # Skip pre-analysis to save time
INPUT_FILE_NAME=R79641.md
```

Run:
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
python multi_batch_2.py
```

---

### **Example 6: Production Run (Optimized Settings)**

Create or edit `.env` file:
```bash
OPENAI_API_KEY=your_api_key_here
MODEL=gpt-4o-mini
MAX_QUESTIONS=10         # 10 questions per batch
MAX_FEEDBACK_LOOPS=7     # Full feedback loops
MAX_PARALLEL_BATCHES=5   # Process 5 batches in parallel
INCLUDE_TRAINING_IN_ALL=false  # Save tokens (training only in first batch)
SKIP_PRE_ANALYSIS=false  # Use pre-analysis for better quality
INPUT_FILE_NAME=R79641.md
```

Run with sleep prevention:
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
caffeinate -i -w python multi_batch_2.py
```

---

### **Example 7: Using Higher-End Model (gpt-4o)**

Create or edit `.env` file:
```bash
OPENAI_API_KEY=your_api_key_here
MODEL=gpt-4o
MAX_QUESTIONS=5          # Smaller batches for expensive model
MAX_FEEDBACK_LOOPS=5
MAX_COMPLETION_TOKENS_TRANSFORMER=8000
MAX_COMPLETION_TOKENS_REVIEWER=20000
INPUT_FILE_NAME=R79641.md
```

Run:
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
caffeinate -i -w python multi_batch_2.py
```

---

### **Example 8: Rate-Limited Run (For API Tier Limits)**

Create or edit `.env` file:
```bash
OPENAI_API_KEY=your_api_key_here
MODEL=gpt-4o-mini
MAX_QUESTIONS=5
GLOBAL_RATE_LIMIT_DELAY=2.0      # 2 second delay between API calls
MAX_CONCURRENT_REQUESTS=2        # Only 2 concurrent requests
MAX_PARALLEL_BATCHES=3            # Process 3 batches at a time
INPUT_FILE_NAME=R79641.md
```

Run:
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
python multi_batch_2.py
```

---

## 📝 Complete .env File Template

Here's a complete `.env` file with all options:

```bash
# ============================================================
# Required: OpenAI API Key
# ============================================================
OPENAI_API_KEY=sk-your-api-key-here

# ============================================================
# Model Selection
# ============================================================
MODEL=gpt-4o-mini

# ============================================================
# Batch Configuration
# ============================================================
MAX_QUESTIONS=10                    # Questions per batch
MAX_FEEDBACK_LOOPS=7                # Feedback loop iterations
MAX_PARALLEL_BATCHES=10             # Batches to process in parallel

# ============================================================
# Training Context
# ============================================================
INCLUDE_TRAINING_IN_ALL=false       # true = all batches get training, false = only first
TRAINING_CONTEXT_FIRST_BATCH_CHARS=60000
TRAINING_CONTEXT_OTHER_BATCH_CHARS=5000

# ============================================================
# Token Limits
# ============================================================
MAX_COMPLETION_TOKENS_TRANSFORMER=5000
MAX_COMPLETION_TOKENS_REVIEWER=16000

# ============================================================
# Rate Limiting
# ============================================================
GLOBAL_RATE_LIMIT_DELAY=0.1         # Delay between API calls (seconds)
MAX_CONCURRENT_REQUESTS=5           # Max concurrent API calls

# ============================================================
# Enhanced Features
# ============================================================
PRE_ANALYSIS_MAX_CHARS=30000        # Limit pre-analysis output
ENABLE_LEARNING_MEMORY=true         # Learn from past failures
ENABLE_SMART_RETRIES=true            # Smart retry logic
PROGRESSIVE_CONTEXT_REDUCTION=true  # Reduce context in later loops
SKIP_PRE_ANALYSIS=false             # Skip pre-analysis step

# ============================================================
# Input File
# ============================================================
INPUT_FILE_NAME=R79641.md           # Specific file, or leave empty for all files

# ============================================================
# Additional Options
# ============================================================
ENABLE_COT=false                     # Enable chain-of-thought reasoning
ENABLE_ANTI_PATTERNS=true           # Enable anti-patterns injection
MAX_USER_CHARS=90000                # Max characters in user prompt
REVIEW_MAX_USER_CHARS=80000         # Max characters in review prompt
CALL_TIMEOUT_SECONDS=75              # API call timeout
```

---

## 🎯 Real-World Scenarios

### **Scenario 1: Testing a New File**

```bash
# 1. Create minimal .env
cat > .env << EOF
OPENAI_API_KEY=your_key_here
MODEL=gpt-4o-mini
MAX_QUESTIONS=3
MAX_FEEDBACK_LOOPS=2
SKIP_PRE_ANALYSIS=true
INPUT_FILE_NAME=R79641.md
EOF

# 2. Run with sleep prevention
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
caffeinate -i -w python multi_batch_2.py
```

---

### **Scenario 2: Production Run on Large File**

```bash
# 1. Create production .env
cat > .env << EOF
OPENAI_API_KEY=your_key_here
MODEL=gpt-4o-mini
MAX_QUESTIONS=10
MAX_FEEDBACK_LOOPS=7
MAX_PARALLEL_BATCHES=5
INCLUDE_TRAINING_IN_ALL=false
SKIP_PRE_ANALYSIS=false
INPUT_FILE_NAME=R79641.md
EOF

# 2. Run in background with logging
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
nohup caffeinate -i python multi_batch_2.py > run_$(date +%Y%m%d_%H%M%S).log 2>&1 &

# 3. Monitor progress
tail -f run_*.log
```

---

### **Scenario 3: Quick Iteration (Fast Testing)**

```bash
# Set environment variables inline
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate

export MAX_QUESTIONS=2
export MAX_FEEDBACK_LOOPS=1
export SKIP_PRE_ANALYSIS=true
export INPUT_FILE_NAME=R79641.md

python multi_batch_2.py
```

---

## 📊 Monitoring Progress

### **Check if process is running:**
```bash
ps aux | grep multi_batch_2.py
```

### **View output files:**
```bash
# Check output directory
ls -lh output/SPSS_output_*.sps

# Check batch outputs
ls -lh output/batch_outputs/

# Check review reports
ls -lh output/review_reports/
```

### **View logs in real-time:**
```bash
# If running in background
tail -f multi_batch_2.log

# Or if using nohup
tail -f nohup.out
```

---

## 🛠️ Troubleshooting

### **Error: Module not found**
```bash
# Make sure virtual environment is activated
source ../.venv/bin/activate
```

### **Error: API key not found**
```bash
# Check .env file exists and has API key
cat .env | grep OPENAI_API_KEY
```

### **Error: File not found**
```bash
# Check generation directory
ls -la generation/*.md
```

### **Process taking too long**
```bash
# Reduce batch size and parallel batches
export MAX_QUESTIONS=3
export MAX_PARALLEL_BATCHES=2
```

---

## 💡 Pro Tips

1. **Start small**: Test with `MAX_QUESTIONS=2-3` before full runs
2. **Use sleep prevention**: Always use `caffeinate` for long runs
3. **Monitor logs**: Keep an eye on the output for errors
4. **Check costs**: Monitor OpenAI usage dashboard
5. **Save configurations**: Keep different `.env` files for different scenarios

---

## 📁 Output Files

After running, you'll find:

- **SPSS Scripts**: `output/SPSS_output_<filename>.sps`
- **Batch Inputs**: `output/batch_outputs/generation_<filename>_input.jsonl`
- **Batch Outputs**: `output/batch_outputs/generation_<filename>_output.jsonl`
- **Review Reports**: `output/review_reports/processed_<filename>_batch_*_loop_*.jsonl`
- **Learning Memory**: `learning_memory.json` (if enabled)

---

## 🎬 Quick Reference Command

**Most common usage:**
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR && \
source ../.venv/bin/activate && \
caffeinate -i -w python multi_batch_2.py
```


