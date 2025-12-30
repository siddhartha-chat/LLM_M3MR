# High-Level Functionality: multiagentic_batch_efficient.py

## 🎯 What It Does

`multiagentic_batch_efficient.py` is a **sequential batch processing** system that uses two AI agents to automatically generate SPSS validation scripts from survey questions. It processes questions in batches (one batch at a time) to balance efficiency and simplicity.

---

## 🏗️ Architecture: Two AI Agents

### **1. Transformer Agent** (The Code Writer)
- **Job:** Generates SPSS scripts from survey questions
- **Input:** Questions + Training examples
- **Output:** SPSS validation code
- **How:** Calls OpenAI API with prompts

### **2. Reviewer Agent** (The Code Checker)
- **Job:** Reviews generated code for correctness
- **Input:** Generated code + Expected logic
- **Output:** Pass/Fail + Feedback for fixes
- **How:** Calls OpenAI API to review

---

## 🔄 High-Level Flow

```
1. Load Training Examples
   ↓
2. Read Question File(s)
   ↓
3. Split Questions into Batches
   ↓
4. For Each Batch (Sequentially):
   ├─ Pre-Analyze: Reviewer curates relevant training examples
   ├─ Generate: Transformer writes SPSS code
   ├─ Review: Reviewer checks the code
   ├─ Fix: If failed, regenerate with feedback
   └─ Repeat until all pass or max loops reached
   ↓
5. Save Results to Output Files
```

---

## 📦 Processing Strategy: Sequential Batching

### **Why Batches?**
- **Efficiency:** Process multiple questions together (saves API calls)
- **Token Savings:** Share training context across questions in a batch
- **Manageable:** Easier to handle than processing all at once

### **Why Sequential?**
- **Simplicity:** One batch at a time (easier to debug)
- **Reliability:** No parallel complexity
- **Control:** Better error handling

### **Example:**
```
100 questions, batch size 10
  ├─ Batch 1: Questions 1-10   → Process → Done
  ├─ Batch 2: Questions 11-20  → Process → Done
  ├─ Batch 3: Questions 21-30  → Process → Done
  └─ ... (one batch at a time)
```

---

## 🔁 The Feedback Loop (Per Batch)

For each batch, the system goes through this loop up to 7 times:

### **Loop 1: First Attempt**
```
1. Reviewer Pre-Analysis:
   "Let me look at these questions and find the best training examples"
   → Curates relevant training examples (saves tokens)

2. Transformer Generation:
   "Now I'll write SPSS code for these questions"
   → Generates SPSS scripts for all questions in batch

3. Reviewer Review:
   "Let me check if the code is correct"
   → Reviews all scripts
   → Returns: ✅ Pass or ❌ Fail with feedback
```

### **Loop 2-7: Fix Mistakes**
If some questions failed:

```
1. Transformer Regeneration:
   "I see the mistakes. Let me fix them using the feedback"
   → Regenerates code only for failed questions
   → Uses reviewer feedback to improve

2. Reviewer Review Again:
   "Let me check the fixes"
   → Reviews regenerated code
   → Returns: ✅ Pass or ❌ Fail again
```

**Continues until:**
- ✅ All questions pass, OR
- ❌ Maximum 7 loops reached

---

## 🎯 Key Features

### **1. Pre-Analysis (Smart Context Curation)**
Before generating code, the Reviewer analyzes the questions and selects only the most relevant training examples. This:
- Saves tokens (doesn't send all training examples)
- Improves quality (focuses on relevant patterns)
- Reduces costs

### **2. Training Context Optimization**
- **First batch:** Gets full training context
- **Later batches:** Can omit training context (if `INCLUDE_TRAINING_IN_ALL=false`)
- **Benefit:** Significant token savings

### **3. Feedback Loop**
- Automatically fixes mistakes
- Up to 7 attempts per batch
- Gets smarter with each iteration

### **4. Error Resilience**
- If a batch fails, continues with next batch
- Saves progress before terminating
- Logs all failures for review

---

## 📊 Step-by-Step Example

Let's say you have 30 questions, batch size 10:

### **Setup:**
```
Questions: 30
Batch size: 10
Number of batches: 3
```

### **Processing:**

**Batch 1 (Questions 1-10):**
```
Loop 1:
  ├─ Pre-Analyze: Find best training examples
  ├─ Generate: Write SPSS code for 10 questions
  ├─ Review: Check all 10 scripts
  └─ Result: 8 pass, 2 fail

Loop 2:
  ├─ Regenerate: Fix the 2 failed questions
  ├─ Review: Check fixes
  └─ Result: All 10 pass! ✅
```

**Batch 2 (Questions 11-20):**
```
Loop 1:
  ├─ Pre-Analyze: Find best training examples
  ├─ Generate: Write SPSS code for 10 questions
  ├─ Review: Check all 10 scripts
  └─ Result: All 10 pass! ✅
```

**Batch 3 (Questions 21-30):**
```
Loop 1:
  ├─ Pre-Analyze: Find best training examples
  ├─ Generate: Write SPSS code for 10 questions
  ├─ Review: Check all 10 scripts
  └─ Result: 7 pass, 3 fail

Loop 2:
  ├─ Regenerate: Fix the 3 failed questions
  ├─ Review: Check fixes
  └─ Result: 2 pass, 1 fail

Loop 3:
  ├─ Regenerate: Fix the 1 failed question
  ├─ Review: Check fix
  └─ Result: All 10 pass! ✅
```

### **Final Result:**
```
✅ 30/30 questions processed
📁 Output: SPSS_output_R79641.sps
```

---

## 🔧 Key Components

### **MultiAgentPipeline**
- **Orchestrates everything**
- Splits questions into batches
- Processes batches sequentially
- Manages the feedback loop
- Collects and saves results

### **TransformerAgent**
- **Writes SPSS code**
- Uses training examples as reference
- Incorporates reviewer feedback for fixes

### **ReviewerAgent**
- **Pre-analyzes questions** (curates training)
- **Reviews generated code** (checks correctness)
- **Provides feedback** (points out mistakes and fixes)

---

## 💡 Why This Design?

### **Sequential Batching:**
- ✅ **Simpler:** Easier to understand and debug
- ✅ **Reliable:** No parallel complexity
- ✅ **Efficient:** Still processes multiple questions together
- ✅ **Token Efficient:** Shares training context per batch

### **Pre-Analysis:**
- ✅ **Smarter:** Only uses relevant training examples
- ✅ **Faster:** Smaller prompts = faster API calls
- ✅ **Cheaper:** Fewer tokens = lower costs

### **Feedback Loop:**
- ✅ **Quality:** Automatically fixes mistakes
- ✅ **Reliable:** Multiple attempts ensure success
- ✅ **Learning:** Gets better with each iteration

---

## 📝 Input/Output

### **Input:**
- Markdown files in `generation/` directory
- Each file contains survey questions in a specific format
- Training examples in `training/` directory

### **Output:**
- SPSS script files: `output/SPSS_output_<filename>.sps`
- Review reports: `output/review_reports/`
- Failure reports (if any questions fail)

---

## 🎬 Real-World Analogy

Think of it like a **code review process**:

1. **Developer (Transformer):** Writes code
2. **Reviewer (Reviewer):** Checks the code
3. **Feedback:** "This line is wrong, fix it like this"
4. **Developer:** Fixes the code
5. **Reviewer:** Checks again
6. **Repeat** until approved

But:
- ✅ Automated with AI
- ✅ Handles multiple questions at once (batches)
- ✅ Processes batches one at a time (sequential)
- ✅ Gets smarter with pre-analysis

---

## 📊 Summary

**multiagentic_batch_efficient.py** is a **sequential batch processing** system that:

1. ✅ Takes survey questions
2. ✅ Splits them into batches
3. ✅ Processes batches **one at a time** (sequential)
4. ✅ Uses two AI agents (Writer + Checker)
5. ✅ Has a feedback loop to fix mistakes
6. ✅ Uses pre-analysis to optimize training context
7. ✅ Outputs validated SPSS code

**Key characteristic:** Sequential processing (one batch at a time) - simpler than parallel, but still efficient with batching.

