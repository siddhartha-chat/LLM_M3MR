# Testing Guide - MAX_QUESTIONS Configuration

## 🎯 Purpose

The `MAX_QUESTIONS` setting allows you to limit how many questions are processed from each generation file. This is **perfect for testing** without processing entire files.

---

## ⚙️ Configuration

### **In `.env` file:**

```bash
# Process only first 5 questions (for quick testing)
MAX_QUESTIONS=5
```

### **Options:**

| Setting | Behavior |
|---------|----------|
| `MAX_QUESTIONS=` (empty) | Process ALL questions ✅ Default |
| `MAX_QUESTIONS=0` | Process ALL questions |
| `MAX_QUESTIONS=3` | Process only first 3 questions |
| `MAX_QUESTIONS=5` | Process only first 5 questions |
| `MAX_QUESTIONS=10` | Process only first 10 questions |

---

## 📋 Example Usage

### **Example 1: Quick Test (3 questions)**

```bash
# Edit .env
MAX_QUESTIONS=3

# Run multiagentic.py
python multiagentic.py
```

**Output:**
```
MULTI-AGENT SPSS SCRIPT GENERATION
================================================================================
  Model: gpt-4o
  Max feedback loops: 5
  ⚠️  Testing mode: Limited to 3 questions per file

PROCESSING: R79641.md
================================================================================
  📊 Limiting to first 3 questions (MAX_QUESTIONS=3)
  Total questions to process: 3

🔄 Loop 1/5
  🔧 TransformerAgent: Generating 3 question(s)...
  🔍 ReviewerAgent: Reviewing 3 question(s)...
  ...
```

---

### **Example 2: Medium Test (10 questions)**

```bash
# Edit .env
MAX_QUESTIONS=10

# Run multiagentic.py
python multiagentic.py
```

---

### **Example 3: Full Production (all questions)**

```bash
# Edit .env
MAX_QUESTIONS=

# Or simply comment it out:
# MAX_QUESTIONS=

# Run multiagentic.py
python multiagentic.py
```

**Output:**
```
MULTI-AGENT SPSS SCRIPT GENERATION
================================================================================
  Model: gpt-4o
  Max feedback loops: 5

PROCESSING: R79641.md
================================================================================
  Total questions to process: 50

🔄 Loop 1/5
  🔧 TransformerAgent: Generating 50 question(s)...
  ...
```

---

## 🔬 Testing Workflow

### **Step 1: Start Small**
```bash
MAX_QUESTIONS=3
python multiagentic.py
```
- Verify logic works correctly
- Check output format
- Estimate token usage

### **Step 2: Medium Test**
```bash
MAX_QUESTIONS=10
python multiagentic.py
```
- Test reviewer feedback loop
- Check quality across more questions
- Validate edge cases

### **Step 3: Full Run**
```bash
MAX_QUESTIONS=
python multiagentic.py
```
- Process entire file
- Generate production output

---

## 📊 Benefits

### **For Testing:**
✅ **Faster iterations** - Process 3-5 questions in seconds  
✅ **Lower cost** - Pay only for questions you process  
✅ **Quick validation** - Verify logic before full run  
✅ **Debugging** - Isolate issues with small batches  

### **For Development:**
✅ **Prompt tuning** - Test prompt changes quickly  
✅ **Model comparison** - Compare models on same subset  
✅ **Logic testing** - Verify specific question types  

---

## 💰 Cost Comparison

Assume file has 50 questions, cost per question ≈ $0.01

| MAX_QUESTIONS | Questions Processed | Estimated Cost |
|---------------|---------------------|----------------|
| 3 | 3 | $0.03 |
| 5 | 5 | $0.05 |
| 10 | 10 | $0.10 |
| 20 | 20 | $0.20 |
| (empty/0) | 50 (all) | $0.50 |

---

## 🎯 Best Practices

### **1. Start Small**
Always test with `MAX_QUESTIONS=3` first:
```bash
MAX_QUESTIONS=3
python multiagentic.py
```

### **2. Verify Output**
Check the generated SPSS file:
```bash
cat output/SPSS_output_R79641.sps
```

### **3. Review Logs**
Check reviewer feedback:
```bash
cat output/review_reports/processed_R79641_review.jsonl | jq
```

### **4. Increment Gradually**
```bash
# Step 1
MAX_QUESTIONS=3   # Initial test

# Step 2
MAX_QUESTIONS=10  # Medium test

# Step 3
MAX_QUESTIONS=    # Full production
```

---

## 🔍 How It Works Internally

```python
# In multiagentic.py

# 1. Read setting from .env
MAX_QUESTIONS = int(os.getenv("MAX_QUESTIONS") or "0")

# 2. Parse all questions from file
questions, function_def = self._parse_generation_file(gen_file)

# 3. Apply limit if set (for testing)
if MAX_QUESTIONS > 0 and len(questions) > MAX_QUESTIONS:
    print(f"📊 Limiting to first {MAX_QUESTIONS} questions")
    questions = questions[:MAX_QUESTIONS]  # Slice to first N

# 4. Process limited set
# Transformer generates only these questions
# Reviewer reviews only these questions
# Output contains only these questions
```

---

## 📝 Output Files

When `MAX_QUESTIONS=5` is set:

```
output/
├── SPSS_output_R79641.sps           # Contains only 5 questions
└── review_reports/
    ├── processed_R79641_review.jsonl   # Review logs for 5 questions
    └── processed_R79641_failures.json  # Failures (if any) for 5 questions
```

---

## ⚠️ Important Notes

### **1. Takes First N Questions**
- Questions are processed in order from the file
- First `MAX_QUESTIONS` questions are selected
- No randomization or shuffling

### **2. Per-File Limit**
- If you have multiple generation files, each is limited to `MAX_QUESTIONS`
- Example: 3 files × 5 questions = 15 total questions processed

### **3. Not Batch-Based**
- This limits total questions, not batches
- All limited questions processed together in one batch
- For batch-based processing, use `main.py` with `MAX_BATCHES`

### **4. Affects Both Passes**
- Initial generation: Limited to `MAX_QUESTIONS`
- Regeneration loops: Only failed questions from the limited set

---

## 🚀 Quick Reference

```bash
# Testing - Process 3 questions
MAX_QUESTIONS=3

# Testing - Process 5 questions  
MAX_QUESTIONS=5

# Testing - Process 10 questions
MAX_QUESTIONS=10

# Production - Process ALL questions
MAX_QUESTIONS=
# or
MAX_QUESTIONS=0
```

---

## 🎯 Common Scenarios

### **Scenario 1: I want to test the system quickly**
```bash
MAX_QUESTIONS=3
python multiagentic.py
```

### **Scenario 2: I want to verify reviewer logic on edge cases**
```bash
# Edit file to put edge cases first
MAX_QUESTIONS=5
python multiagentic.py
```

### **Scenario 3: I want to compare prompt versions**
```bash
# Version A
MAX_QUESTIONS=5
python multiagentic.py
# Save output as output_v1.sps

# Version B (modify prompts)
python multiagentic.py
# Save output as output_v2.sps

# Compare
diff output_v1.sps output_v2.sps
```

### **Scenario 4: Ready for production**
```bash
MAX_QUESTIONS=    # Process all
python multiagentic.py
```

---

## ✅ Summary

- ✅ Add `MAX_QUESTIONS=N` to `.env` for testing
- ✅ Set to `0` or empty for production (all questions)
- ✅ Start with 3-5 questions for quick tests
- ✅ Gradually increase to full dataset
- ✅ Saves time and money during development
- ✅ No code changes needed - just edit `.env`!

---

**Happy Testing!** 🎉



