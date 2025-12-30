# Multi-Agent SPSS Generation Guide

## 🎯 Overview

The multi-agent architecture implements a **Transformer + Reviewer** feedback loop for generating high-quality SPSS validation scripts.

### **Key Components:**

1. **TransformerAgent** - Generates SPSS scripts from survey questions
2. **ReviewerAgent** - Reviews logic correctness and provides targeted feedback
3. **MultiAgentPipeline** - Orchestrates the feedback loop (up to 5 iterations)

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    MultiAgentPipeline                       │
│                                                             │
│  ┌────────────┐    ┌────────────┐    ┌────────────┐      │
│  │  Training  │    │ Generation │    │  Function  │      │
│  │  Context   │───▶│  Questions │───▶│    Defs    │      │
│  └────────────┘    └────────────┘    └────────────┘      │
│         │                  │                  │            │
│         └──────────────────┴──────────────────┘            │
│                            │                                │
│                            ▼                                │
│              ┌─────────────────────────┐                   │
│              │   TransformerAgent      │                   │
│              │  (Generates SPSS)       │                   │
│              └─────────────────────────┘                   │
│                            │                                │
│                            ▼                                │
│              ┌─────────────────────────┐                   │
│              │    ReviewerAgent        │                   │
│              │  (Checks Logic)         │                   │
│              └─────────────────────────┘                   │
│                            │                                │
│                     ┌──────┴──────┐                        │
│                     │             │                         │
│                ┌────▼────┐   ┌────▼────┐                  │
│                │  PASS   │   │  FAIL   │                  │
│                │         │   │         │                   │
│                │ Write   │   │ Retry   │                  │
│                │ Output  │   │ with    │                  │
│                │         │   │Feedback │                  │
│                └─────────┘   └────┬────┘                  │
│                                   │                         │
│                                   │  Loop (max 5)          │
│                                   └────────────────┐       │
│                                                    │       │
│              ┌─────────────────────────┐          │       │
│              │   TransformerAgent      │◄─────────┘       │
│              │  (Regenerate Failed)    │                  │
│              └─────────────────────────┘                  │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

## 🚀 How to Run

### **Option 1: Run Multi-Agent Pipeline**

```bash
python multiagentic.py
```

### **Option 2: Run Original Single-Agent**

```bash
python main.py
```

---

## ⚙️ Configuration

### **In `.env` file:**

```bash
# Multi-Agent Feedback Loop Configuration
MAX_FEEDBACK_LOOPS=5  # How many times to retry failed questions
```

**Settings:**
- `MAX_FEEDBACK_LOOPS=1` - Single review pass (no retry)
- `MAX_FEEDBACK_LOOPS=5` - Up to 5 retry attempts (recommended)
- `MAX_FEEDBACK_LOOPS=10` - More thorough but slower/expensive

---

## 🔄 Feedback Loop Process

### **Loop Iteration:**

```
1. TransformerAgent generates SPSS scripts for all questions
     ↓
2. ReviewerAgent checks logic for each question
     ↓
3. IF all pass → DONE ✅
   IF some fail → GO TO 4
     ↓
4. TransformerAgent regenerates ONLY failed questions
   - Receives reviewer's root causes
   - Receives specific instructions
   - Gets training example patches (if needed)
     ↓
5. Repeat from step 2 (max 5 times)
```

### **Example Flow:**

```
Loop 1: Generate all 10 questions
        Review: 7 passed, 3 failed (hidS5, S0, SPECIALTY)
        
Loop 2: Regenerate 3 failed questions with feedback
        Review: 9 passed, 1 failed (hidS5 still wrong)
        
Loop 3: Regenerate 1 failed question with enhanced feedback
        Review: 10 passed ✅
        
DONE: All questions validated!
```

---

## 📋 Reviewer Logic

### **What Reviewer Checks:**

✅ **Logic Correctness:**
- Does the SPSS code implement the expected logic?
- Are entry conditions properly translated?
- Are validation rules implemented?
- Are computed/hidden variables derived correctly?

❌ **What Reviewer IGNORES:**
- Code style and formatting
- Variable naming conventions
- Code length or verbosity
- Comment completeness

### **Reviewer Output Schema:**

```json
{
  "question_id": "hidS5",
  "pass": false,
  "root_causes": [
    "Doesn't recognise VariableType: 'Hidden' + Disabled: 'true'",
    "Treats it like a regular survey question requiring validation"
  ],
  "instructions": [
    "Add COMPUTE statements to derive hidS5_1 to hidS5_4 from S5 responses",
    "Use DO IF statements based on S5_1, S5_2, etc. to set values",
    "Remove validation-only logic, this is a computed variable"
  ],
  "training_example_patch": {
    "title": "Hidden/Computed Variable Pattern",
    "example": "* For Hidden variables:\nCOMPUTE hidVar_1 = 0.\nDO IF (sourceVar = 1).\n    COMPUTE hidVar_1 = 1.\nEND IF.",
    "why_needed": "Dataset lacks examples of VariableType: 'Hidden' derivation"
  }
}
```

---

## 📂 Output Files

### **1. SPSS Scripts** (passing questions only)

```
output/SPSS_output_R79641.sps
```

Contains only questions that passed logic review.

### **2. Review Logs** (all iterations)

```
output/review_reports/processed_R79641_review.jsonl
```

**Format:**
```json
{"loop": 0, "timestamp": "2025-10-10T00:40:00", "findings": [...]}
{"loop": 1, "timestamp": "2025-10-10T00:41:30", "findings": [...]}
{"loop": 2, "timestamp": "2025-10-10T00:43:15", "findings": [...]}
```

### **3. Failure Reports** (if any remain)

```
output/review_reports/processed_R79641_failures.json
```

Lists questions that failed all retries with root causes and instructions.

---

## 🎯 Key Features

### **1. Targeted Regeneration**

Only failed questions are regenerated, saving:
- ✅ API costs (fewer tokens)
- ✅ Time (faster processing)
- ✅ Quality (passing questions unchanged)

### **2. Training Example Patches**

When reviewer detects missing patterns:
```
Original Training: [No hidden variable examples]
         ↓
Reviewer: "Dataset lacks Hidden variable pattern"
         ↓
Adds Patch: [Minimal example of COMPUTE logic]
         ↓
Transformer: Learns pattern on-the-fly
```

### **3. Root Cause Analysis**

Precise, actionable feedback:
```
❌ Bad:  "Script is wrong"
✅ Good: "Doesn't recognise VariableType: 'Hidden' + Disabled: 'true'"

❌ Bad:  "Fix the logic"
✅ Good: "Add COMPUTE statements to derive values from S5 responses"
```

---

## 📊 Cost Comparison

### **Single-Agent (main.py):**
```
Batch 1: All 10 questions → ~$0.30
No review, no retry
Errors persist in output
```

### **Multi-Agent (multiagentic.py):**
```
Loop 1: All 10 questions → ~$0.30
Review 1: Check logic → ~$0.10
Loop 2: 3 failed questions → ~$0.10
Review 2: Check logic → ~$0.03
Loop 3: 1 failed question → ~$0.03
Review 3: Check logic → ~$0.01
────────────────────────────────────
Total: ~$0.57 (vs $0.30)

Cost increase: +90%
Quality increase: Significant (catches logical errors)
```

**Worth it?** ✅ Yes - much higher quality outputs

---

## 🔍 Monitoring Progress

### **During Execution:**

```
🚀 Initializing Multi-Agent Pipeline...
  Model: gpt-4o
  Max feedback loops: 5

📚 Loading training context...

============================================================
PROCESSING: R79641.md
============================================================
  Total questions: 50

🔄 Loop 1/5
🔄 TransformerAgent: Generating scripts for 50 question(s)...
  ✓ Parsed 50 script(s)

🔍 ReviewerAgent: Reviewing 50 output(s)...
  ✓ Review complete: 45 passed, 5 failed

🔄 Loop 2/5
🔁 TransformerAgent: Regenerating 5 failed question(s)...
  ✓ Parsed 5 script(s)

🔍 ReviewerAgent: Reviewing 5 output(s)...
  ✓ Review complete: 4 passed, 1 failed

🔄 Loop 3/5
🔁 TransformerAgent: Regenerating 1 failed question(s)...
  ✓ Parsed 1 script(s)

🔍 ReviewerAgent: Reviewing 1 output(s)...
  ✓ Review complete: 1 passed, 0 failed

  ✅ All 50 questions passed!

✅ Output written: output/SPSS_output_R79641.sps
  Passing questions: 50/50

============================================================
✅ PIPELINE COMPLETE in 245.3s
============================================================
```

---

## 🐛 Troubleshooting

### **Issue: "All questions fail review"**

**Cause:** Reviewer might be too strict or misunderstanding logic

**Fix:**
1. Check `output/review_reports/*.jsonl` for reviewer feedback
2. Review `root_causes` and `instructions`
3. Adjust reviewer prompt if needed
4. Or increase `MAX_FEEDBACK_LOOPS`

### **Issue: "JSON parse error in reviewer"**

**Cause:** Reviewer LLM not returning valid JSON

**Fix:**
- Using `response_format={"type": "json_object"}` should force JSON
- Check reviewer prompt clarity
- Try different model (gpt-4o recommended)

### **Issue: "High costs"**

**Cause:** Too many feedback loops

**Fix:**
1. Reduce `MAX_FEEDBACK_LOOPS` to 3
2. Improve training examples
3. Use gpt-4o-mini for reviewer (cheaper)

### **Issue: "Questions keep failing same issue"**

**Cause:** Transformer not learning from feedback

**Fix:**
1. Check if `training_example_patch` is being applied
2. Make reviewer instructions more specific
3. Add permanent examples to training dataset

---

## 📈 Quality Metrics

Track these in review logs:

```python
import json
from pathlib import Path

log_file = Path("output/review_reports/processed_R79641_review.jsonl")

loops = []
for line in log_file.read_text().split('\n'):
    if line:
        data = json.loads(line)
        passed = sum(1 for f in data['findings'] if f['pass'])
        total = len(data['findings'])
        loops.append(f"Loop {data['loop']}: {passed}/{total} passed")

print('\n'.join(loops))
```

**Output:**
```
Loop 0: 45/50 passed (90%)
Loop 1: 48/50 passed (96%)
Loop 2: 50/50 passed (100%) ✅
```

---

## 🎯 Best Practices

### **1. Start with Lower Loops for Testing**

```bash
# In .env for initial testing
MAX_FEEDBACK_LOOPS=2
```

### **2. Review Failure Reports**

Always check `failures.json` to improve training data:
```bash
cat output/review_reports/*_failures.json | jq '.[] | {question_id, root_causes}'
```

### **3. Monitor Costs**

Track token usage across loops - consider reducing loops if costs are high.

### **4. Improve Training Data**

Use `training_example_patch` insights to enhance permanent training examples.

---

## 🔄 Comparison: main.py vs multiagentic.py

| Feature | main.py | multiagentic.py |
|---------|---------|-----------------|
| **Architecture** | Single-agent | Multi-agent |
| **Quality Check** | None | Automated review |
| **Retries** | No | Yes (up to 5) |
| **Logic Validation** | Manual | Automated |
| **Cost** | Lower (~$0.30) | Higher (~$0.57) |
| **Quality** | Variable | Consistent |
| **Error Detection** | Manual review needed | Automatic |
| **Feedback Loop** | No | Yes |
| **Training Patches** | No | Yes (on-the-fly) |
| **Output Quality** | Unknown until manual review | Validated automatically |

---

## 🚀 Quick Start

### **1. First Test Run:**

```bash
# Set low loop count for testing
echo "MAX_FEEDBACK_LOOPS=2" >> .env

# Run with small batch
python multiagentic.py
```

### **2. Review Results:**

```bash
# Check passing questions
cat output/SPSS_output_R79641.sps

# Check review logs
cat output/review_reports/processed_R79641_review.jsonl | jq

# Check failures (if any)
cat output/review_reports/processed_R79641_failures.json | jq
```

### **3. Production Run:**

```bash
# Set full loop count
sed -i '' 's/MAX_FEEDBACK_LOOPS=2/MAX_FEEDBACK_LOOPS=5/' .env

# Run on all files
python multiagentic.py
```

---

## 📞 Support

**Common Questions:**

**Q: Should I always use multiagentic.py?**  
A: For production/important work, yes. For quick tests, main.py is faster.

**Q: How do I know if a question really failed?**  
A: Check `root_causes` in review logs - they're specific and actionable.

**Q: Can I adjust the reviewer strictness?**  
A: Yes, edit `prompts/reviewer/reviewer_prompt.txt` to change criteria.

**Q: What if costs are too high?**  
A: Reduce MAX_FEEDBACK_LOOPS or use gpt-4o-mini for review.

---

## ✅ Summary

**Multi-agent architecture provides:**
- ✅ Automatic logic validation
- ✅ Targeted regeneration (cost-effective)
- ✅ On-the-fly training patches
- ✅ Detailed failure analysis
- ✅ Consistent quality output
- ✅ Comprehensive logging

**Trade-offs:**
- ⚠️ ~90% higher cost
- ⚠️ ~2-3x longer runtime
- ✅ Much higher quality
- ✅ Less manual review needed

**Recommendation:** Use `multiagentic.py` for production, `main.py` for quick prototyping.

🎉 **Your multi-agent SPSS generation system is ready!**

