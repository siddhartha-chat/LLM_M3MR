# Quick Reference - Batch Control

## 🚀 How to Control Batches

### Option 1: Environment Variables (Easiest) ✅

Edit your `.env` file:

```bash
BATCH_SIZE=5                  # Questions per batch
MAX_BATCHES=2                 # Limit to 2 batches (leave unset for unlimited)
INCLUDE_TRAINING_IN_ALL=false # Training only in first batch (saves 75% cost!)
```

### Option 2: Direct Code

Edit `main.py` line 630:

```python
processor = SPSSBatchProcessor(batch_size=5, max_batches=2)
```

---

## 📊 Common Scenarios

| Scenario | BATCH_SIZE | MAX_BATCHES | Result |
|----------|------------|-------------|--------|
| **Testing** | 5 | 1 | Process 5 questions |
| **Small test** | 3 | 1 | Process 3 questions |
| **Cost control** | 5 | 5 | Process max 25 questions |
| **Production** | 5 | (not set) | Process ALL questions |

---

## 💡 Quick Examples

### Test with 1 batch only:
```bash
# In .env
MAX_BATCHES=1
```

### Process 10 questions:
```bash
# In .env
BATCH_SIZE=5
MAX_BATCHES=2
```

### Process everything:
```bash
# In .env
BATCH_SIZE=5
# MAX_BATCHES not set or commented out
```

---

## 🧮 Calculate Questions Processed

```
Questions Processed = BATCH_SIZE × MAX_BATCHES
```

**Examples:**
- BATCH_SIZE=5, MAX_BATCHES=1 → 5 questions
- BATCH_SIZE=5, MAX_BATCHES=2 → 10 questions
- BATCH_SIZE=3, MAX_BATCHES=5 → 15 questions
- BATCH_SIZE=10, MAX_BATCHES=10 → 100 questions

---

## ⚡ What Changed in main.py

1. **Line 12:** Added `batch_size` and `max_batches` parameters
2. **Line 22-23:** Load from environment or use defaults
3. **Line 235-245:** Check batch limit and stop if reached
4. **Line 633-640:** Display batch control settings

---

## 📝 Your Output Will Show

```
⚙️  Batch Control Settings:
  - Questions per batch: 5
  - Max batches to process: 2
  - Max questions to process: 10
  - Model: gpt-4o-mini
```

Then when processing:
```
  Total questions found: 50
  ⚠️  Reached max batch limit (2). Stopping batch creation.
  Processing 10 out of 50 questions.
✓ Created 2 batch(es) of questions
```

---

## 🔧 Troubleshooting

**Not limiting batches?**
1. Check `.env` has `MAX_BATCHES=2` (no quotes)
2. Verify `.env` is in same folder as `main.py`
3. Try passing directly: `SPSSBatchProcessor(max_batches=2)`

**Want more control?**
- See `BATCH_CONTROL_GUIDE.md` for detailed documentation
- See `env.example.txt` for `.env` file template

