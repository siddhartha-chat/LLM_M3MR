# Batch Control Guide

This guide explains how to control the number of batches processed by the SPSS Batch Processor.

## 🎯 Overview

You now have multiple ways to control batch processing:

1. **Control questions per batch** (BATCH_SIZE)
2. **Limit the maximum number of batches** (MAX_BATCHES)
3. **Pass parameters directly in code**

---

## 📋 Method 1: Using Environment Variables (Recommended)

Create or edit your `.env` file in the project root:

```bash
# .env file

# OpenAI Configuration
OPENAI_API_KEY=your_key_here
MODEL=gpt-4o-mini

# Batch Control Settings
BATCH_SIZE=5          # Number of questions per batch (default: 5)
MAX_BATCHES=2         # Maximum number of batches to process (default: unlimited)
```

### Examples:

**Process only 2 batches (10 questions with batch_size=5):**
```bash
BATCH_SIZE=5
MAX_BATCHES=2
```

**Process only 1 batch for testing:**
```bash
BATCH_SIZE=5
MAX_BATCHES=1
```

**Process 3 questions at a time, max 5 batches (15 questions total):**
```bash
BATCH_SIZE=3
MAX_BATCHES=5
```

**Process all questions (no limit):**
```bash
BATCH_SIZE=5
# MAX_BATCHES is not set or commented out = unlimited
```

---

## 📋 Method 2: Direct Code Modification

Modify `main.py` to pass parameters directly:

```python
def main():
    # ... existing code ...
    
    # Initialize processor with custom settings
    processor = SPSSBatchProcessor(
        batch_size=5,      # Questions per batch
        max_batches=2      # Limit to 2 batches
    )
    
    # ... rest of code ...
```

### Examples:

**Test with 1 batch only:**
```python
processor = SPSSBatchProcessor(max_batches=1)
```

**Process 10 questions per batch, unlimited batches:**
```python
processor = SPSSBatchProcessor(batch_size=10)
```

**Custom model + batch control:**
```python
processor = SPSSBatchProcessor(
    model='gpt-4o',
    batch_size=3,
    max_batches=5
)
```

---

## 📋 Method 3: Command Line Arguments (Future Enhancement)

You can enhance the script to accept command-line arguments. Here's how:

### Add to `main.py`:

```python
import argparse

def main():
    # Parse command line arguments
    parser = argparse.ArgumentParser(description='SPSS Script Generation - Batch Processor')
    parser.add_argument('--batch-size', type=int, default=None, help='Number of questions per batch')
    parser.add_argument('--max-batches', type=int, default=None, help='Maximum number of batches to process')
    parser.add_argument('--model', type=str, default=None, help='OpenAI model to use')
    
    args = parser.parse_args()
    
    # Initialize with arguments
    processor = SPSSBatchProcessor(
        model=args.model,
        batch_size=args.batch_size,
        max_batches=args.max_batches
    )
    
    # ... rest of code ...
```

### Usage:

```bash
# Process only 2 batches
python main.py --max-batches 2

# Use 3 questions per batch, max 5 batches
python main.py --batch-size 3 --max-batches 5

# Use GPT-4o and process only 1 batch for testing
python main.py --model gpt-4o --max-batches 1
```

---

## 🧮 Calculating Batch Numbers

### Formula:
```
Total Questions ÷ Batch Size = Total Batches (rounded up)
```

### Examples:

| Total Questions | Batch Size | Total Batches | Max Batches | Questions Processed |
|----------------|------------|---------------|-------------|---------------------|
| 50             | 5          | 10            | None        | 50 (all)            |
| 50             | 5          | 10            | 2           | 10                  |
| 50             | 5          | 10            | 1           | 5                   |
| 50             | 10         | 5             | 2           | 20                  |
| 37             | 5          | 8             | 3           | 15                  |

---

## 💡 Use Cases

### 1. Testing (Recommended: 1-2 batches)
Process a small sample to verify your setup works:

```bash
BATCH_SIZE=5
MAX_BATCHES=1
```

**Result:** Processes 5 questions only

---

### 2. Cost Control
Limit processing to control API costs:

```bash
BATCH_SIZE=5
MAX_BATCHES=10
```

**Result:** Processes maximum 50 questions

---

### 3. Incremental Processing
Process files in stages:

**Stage 1:**
```bash
MAX_BATCHES=5    # Process first 25 questions
```

**Stage 2:**
After reviewing results, remove the limit:
```bash
# MAX_BATCHES not set = process all remaining
```

---

### 4. Development/Debugging
Quick iteration during development:

```bash
BATCH_SIZE=2     # Smaller batches
MAX_BATCHES=1    # Only one batch
```

**Result:** Processes 2 questions, fast feedback

---

### 5. Production (No Limits)
Process everything:

```bash
BATCH_SIZE=5
# MAX_BATCHES not set
```

**Result:** Processes all questions in the file

---

## 📊 Output Examples

### With Batch Limit:

```
============================================================
SPSS SCRIPT GENERATION - BATCH PROCESSOR
============================================================

⚙️  Batch Control Settings:
  - Questions per batch: 5
  - Max batches to process: 2
  - Max questions to process: 10
  - Model: gpt-4o-mini

============================================================
PROCESSING: R79641.md
============================================================
  Total questions found: 50
✓ Created 2 batch(es) of questions
  ⚠️  Reached max batch limit (2). Stopping batch creation.
  Processing 10 out of 50 questions.
```

### Without Batch Limit:

```
============================================================
SPSS SCRIPT GENERATION - BATCH PROCESSOR
============================================================

⚙️  Batch Control Settings:
  - Questions per batch: 5
  - Max batches to process: Unlimited (will process all)
  - Model: gpt-4o-mini

============================================================
PROCESSING: R79641.md
============================================================
  Total questions found: 50
✓ Created 10 batch(es) of questions
```

---

## ⚠️ Important Notes

1. **Batch API Timing:**
   - OpenAI Batch API can take 24 hours to complete
   - Start with small batches (1-2) for testing

2. **Cost Estimation:**
   - Check token usage summary after completion
   - Batch API gives 50% discount
   - Use `max_batches` to control costs during testing

3. **Partial Processing:**
   - If you stop processing early (using max_batches), you'll get partial output
   - The output file will only contain processed questions
   - To process remaining questions, you'd need to modify the input file

4. **Priority Settings:**
   The system uses this priority order:
   ```
   1. Direct function parameters (highest priority)
   2. Environment variables (.env file)
   3. Default values (batch_size=5, max_batches=None)
   ```

---

## 🚀 Quick Start Examples

### Example 1: First Time Testing
```bash
# In .env file
BATCH_SIZE=3
MAX_BATCHES=1
```

Run: `python main.py`

**Result:** Processes only 3 questions (1 batch × 3 questions)

---

### Example 2: Cost-Controlled Processing
```bash
# In .env file
BATCH_SIZE=5
MAX_BATCHES=5
```

Run: `python main.py`

**Result:** Processes maximum 25 questions

---

### Example 3: Full Production Run
```bash
# In .env file
BATCH_SIZE=5
# MAX_BATCHES not set
```

Run: `python main.py`

**Result:** Processes all questions in all generation files

---

## 📝 Summary

**To control batches:**

1. ✅ Set `MAX_BATCHES` in `.env` file (easiest)
2. ✅ Set `BATCH_SIZE` in `.env` file (control questions per batch)
3. ✅ Pass parameters to `SPSSBatchProcessor()` (programmatic control)
4. ✅ Add command-line arguments (future enhancement)

**Default behavior:**
- `BATCH_SIZE=5` (5 questions per batch)
- `MAX_BATCHES=None` (processes all questions)

**Testing recommendation:**
- Start with `MAX_BATCHES=1` to verify setup
- Gradually increase or remove limit for production

---

## 🆘 Troubleshooting

**Issue:** "Still processing all questions"
- **Solution:** Check `.env` file has `MAX_BATCHES=2` (no quotes, just the number)
- **Solution:** Verify you're reading the `.env` file (should see settings in output)

**Issue:** "Not respecting batch limit"
- **Solution:** Make sure `.env` is in the same directory as `main.py`
- **Solution:** Try passing directly: `SPSSBatchProcessor(max_batches=2)`

**Issue:** "Want to process specific questions"
- **Solution:** Edit the generation `.md` file to include only desired questions
- **Solution:** Use `MAX_BATCHES` to limit total processing



