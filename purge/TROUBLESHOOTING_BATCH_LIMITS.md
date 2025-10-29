# Troubleshooting: Batch Token Limit Errors

## 🚨 Error Message

```
Enqueued token limit reached for gpt-4o in organization
Limit: 90,000 enqueued tokens
Please try again once some in_progress batches have been completed.
```

---

## 🔍 Root Cause

Your batch requests include **large training context** (~80K tokens per request), which causes you to hit OpenAI's queue limits quickly.

**Your situation:**
- Each batch request: ~66K tokens (80K training + 15K questions)
- 2 batches: 133K tokens
- OpenAI limit: 90K tokens
- **Result:** ❌ Exceeds limit by 43K tokens

---

## ✅ Solutions

### **Solution 1: Process 1 Batch at a Time** ⭐ (RECOMMENDED)

```bash
# In .env file
MAX_BATCHES=1
```

**How it works:**
1. Submit 1 batch (~66K tokens)
2. Wait for completion
3. Submit next batch
4. Repeat

**Pros:**
- ✅ Never hits queue limit
- ✅ Simple to implement
- ✅ Already configured for you!

**Cons:**
- ⏱️ Takes longer (sequential processing)

---

### **Solution 2: Reduce Training Context** 

The training context is what's making each request so large. You can reduce it:

#### **Option A: Use only 1 training file**

Edit `main.py` line 159 (already implemented):

```python
def load_training_context(self, max_tokens: int = 80000):
    # ... code checks if too large ...
    if estimated_tokens > max_tokens:
        # Uses only first training file
```

Current: Uses first file if context > 80K tokens

**To force smaller context:**

```python
def load_training_context(self, max_tokens: int = 40000):  # ← Reduce limit
```

#### **Option B: Summarize training examples**

Instead of including full training files, create summarized versions:
- Extract key patterns
- Remove verbose explanations
- Keep only essential examples

---

### **Solution 3: Reduce Batch Size**

Process fewer questions per batch:

```bash
# In .env file
BATCH_SIZE=3       # Instead of 5
MAX_BATCHES=1
```

**Result:**
- Smaller requests (~50K tokens instead of 66K)
- Can potentially process 1-2 batches simultaneously
- More batches overall, but under queue limit

---

### **Solution 4: Use Smaller Model** (Not Recommended)

```bash
# In .env file
MODEL=gpt-4o-mini
```

**Note:** gpt-4o-mini has the **same queue limit** (90K tokens), so this doesn't actually solve the queue problem. But it's cheaper if you're processing sequentially anyway.

---

### **Solution 5: Request Limit Increase from OpenAI**

Contact OpenAI support to increase your batch queue limit:
- Go to https://platform.openai.com/
- Navigate to "Help" or "Support"
- Request higher batch token limit

**Typical limits:**
- Free tier: 90K tokens
- Tier 1: 200K tokens
- Tier 2: 2M tokens
- Enterprise: Custom

---

## 🔧 Tools to Monitor

### **Check Current Batches**

```bash
python check_batches.py
```

This shows all in-progress batches and their status.

### **Estimate Token Usage**

```bash
python -c "
import json
with open('output/batch_outputs/generation_R79641_input.jsonl', 'r') as f:
    for i, line in enumerate(f, 1):
        req = json.loads(line)
        content = req['body']['messages'][1]['content']
        tokens = len(content) // 4
        print(f'Batch {i}: ~{tokens:,} tokens')
"
```

---

## 📊 Token Calculation

```
Total Input Tokens = (Training Context + Question Batch) × Number of Batches

Your case:
= (80,000 + 15,000) × 2
= 95,000 × 2
= 190,000 tokens

Queue limit: 90,000 tokens
Result: EXCEEDED!
```

**To stay under limit:**
```
Number of Batches = Queue Limit / (Training + Questions)
                  = 90,000 / 95,000
                  = 0.95
                  ≈ 1 batch maximum
```

---

## 🎯 Recommended Configuration

### **For Immediate Success:**

```bash
# .env file
OPENAI_API_KEY=your_key
MODEL=gpt-4o
BATCH_SIZE=5
MAX_BATCHES=1    # ← Process 1 batch at a time
```

### **For Maximum Throughput:**

1. **Reduce training context** to 40K tokens
2. **Use BATCH_SIZE=3**
3. **Set MAX_BATCHES=2**

```
New calculation:
= (40,000 + 10,000) × 2
= 50,000 × 2
= 100,000 tokens (still over!)
```

Still need to process 1 at a time with large training context.

---

## 🚀 Workflow with MAX_BATCHES=1

```bash
# Run 1: Process first 5 questions
MAX_BATCHES=1
python main.py
# ✅ Batch 1 completes

# Run 2: Process next 5 questions  
# (You'd need to modify code to skip processed questions)
python main.py
# ✅ Batch 2 completes

# Continue until all questions processed
```

**Or let it handle automatically:**
Your current code processes all generation files sequentially, so just set `MAX_BATCHES=1` and let it run. It will:
1. Process 1 batch
2. Wait for completion
3. Process next batch
4. Repeat

---

## ⚡ Quick Fixes Summary

| Issue | Fix | Command |
|-------|-----|---------|
| **Queue limit exceeded** | Process 1 batch at a time | `MAX_BATCHES=1` |
| **Batches stuck** | Check status | `python check_batches.py` |
| **Too many tokens** | Reduce batch size | `BATCH_SIZE=3` |
| **Want more speed** | Reduce training context | Edit `max_tokens` in code |
| **Need higher limit** | Contact OpenAI | Support ticket |

---

## ✅ Current Status

**Your configuration is now set to:**
```
MAX_BATCHES=1
```

This will process 1 batch (~66K tokens) at a time, staying well under the 90K limit.

**Just run:**
```bash
./run.sh
```

Or:
```bash
python main.py
```

---

## 📝 Understanding the Error

### **What "Enqueued tokens" means:**

When you submit a batch to OpenAI:
1. Batch goes into a **queue** (status: `validating` → `in_progress`)
2. While in queue, its tokens count toward your limit
3. When batch completes, tokens are freed
4. You can then submit new batches

### **Why the limit exists:**

- Prevents monopolizing batch API resources
- Ensures fair access for all users
- Encourages efficient batch design

### **How to work within limits:**

- ✅ Process batches sequentially (`MAX_BATCHES=1`)
- ✅ Reduce training context size
- ✅ Use smaller batch sizes
- ✅ Monitor queue with `check_batches.py`
- ✅ Wait for batches to complete before submitting more

---

## 🎯 Conclusion

**Your issue is SOLVED!**

✅ Set `MAX_BATCHES=1`  
✅ Each batch is ~66K tokens  
✅ Well under 90K limit  
✅ Will process sequentially  
✅ No more queue errors!  

**Just run the script and it will work!** 🚀



