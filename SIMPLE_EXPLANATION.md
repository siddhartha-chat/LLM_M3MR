# Simple Explanation of multi_batch_2.py Logic

## 🎯 What Does This Script Do?

This script takes survey questions and automatically generates SPSS validation scripts (code) for them. It uses AI to write the code, then checks if it's correct, and fixes mistakes if needed.

Think of it like:
- **Input**: Survey questions (like "Did you buy product X? Yes/No")
- **Output**: SPSS code that validates those answers are correct

---

## 🏗️ The Big Picture: Two AI Agents Working Together

The script uses **two AI agents** that work together:

1. **Transformer Agent** (The Writer)
   - Takes survey questions
   - Writes SPSS code to validate them
   - Like a programmer writing code

2. **Reviewer Agent** (The Checker)
   - Looks at the code the Transformer wrote
   - Checks if it's correct
   - Points out mistakes and suggests fixes
   - Like a code reviewer

They work in a **feedback loop**: Write → Check → Fix → Check again → until it's correct!

---

## 📦 How It Processes Questions: Batching

Instead of processing all questions one-by-one (slow!), it groups them into **batches**:

```
100 questions → Split into batches of 10
  ├─ Batch 1: Questions 1-10
  ├─ Batch 2: Questions 11-20
  ├─ Batch 3: Questions 21-30
  └─ ... and so on
```

**Why batches?**
- Faster: Process multiple questions at once
- Cheaper: Share training examples across questions
- Parallel: Process multiple batches simultaneously

---

## 🔄 The Main Flow (Step by Step)

### **Step 1: Setup**
```
1. Load configuration from .env file
2. Load training examples (good examples of SPSS code)
3. Find all the question files to process
```

### **Step 2: Process Each File**
For each file (like `R79641.md`):

```
1. Read the file
2. Extract all questions
3. Split questions into batches
```

### **Step 3: Process Batches in Parallel**
Instead of doing batches one after another, it does **multiple batches at the same time**:

```
Batch 1 ──┐
Batch 2 ──┼── Process these 5 batches
Batch 3 ──┤   at the same time!
Batch 4 ──┤
Batch 5 ──┘
```

This is called **parallel processing** - much faster!

### **Step 4: Process Each Batch (The Feedback Loop)**

For each batch, it goes through this loop up to 7 times:

#### **Loop 1: First Attempt**
```
1. Reviewer: "Let me look at these questions and find the best examples"
   → Curates training examples (pre-analysis)

2. Transformer: "Now I'll write SPSS code for these questions"
   → Generates SPSS scripts

3. Reviewer: "Let me check if the code is correct"
   → Reviews the generated code
   → Returns: ✅ Pass or ❌ Fail with feedback
```

#### **Loop 2-7: Fix Mistakes**
If some questions failed:

```
1. Transformer: "I see the mistakes. Let me fix them"
   → Regenerates code with the feedback

2. Reviewer: "Let me check again"
   → Reviews the fixed code
   → Returns: ✅ Pass or ❌ Fail again
```

This continues until:
- ✅ All questions pass, OR
- ❌ Maximum 7 loops reached

---

## 🧠 Smart Features

### **1. Learning Memory**
The script remembers common mistakes and fixes:
- "Oh, I've seen this type of error before"
- "Last time, this fix worked"
- Uses that knowledge for future questions

### **2. Progressive Context Reduction**
As it tries more times, it uses less training context:
- Loop 1: Full training examples (60,000 chars)
- Loop 2: Reduced context (30,000 chars)
- Loop 3: Even less (15,000 chars)
- Why? Saves tokens (money) and focuses on the problem

### **3. Rate Limiting**
Prevents hitting API limits:
- Waits a bit between API calls
- Limits how many calls happen at once
- Adjusts automatically if errors occur

### **4. Pre-Analysis (Optional)**
Before generating code, the Reviewer can:
- Look at the questions
- Pick the most relevant training examples
- Create a focused guide for the Transformer
- Like giving a student the right textbook chapters

---

## 📊 Example Walkthrough

Let's say you have 30 questions:

### **Setup**
```
Questions: 30
Batch size: 10
Number of batches: 3
```

### **Processing**
```
Chunk 1: Process batches 1, 2, 3 in parallel
  ├─ Batch 1: Questions 1-10
  │   ├─ Loop 1: Generate → Review → 8 pass, 2 fail
  │   ├─ Loop 2: Fix 2 → Review → All pass! ✅
  │
  ├─ Batch 2: Questions 11-20
  │   ├─ Loop 1: Generate → Review → 10 pass! ✅
  │
  └─ Batch 3: Questions 21-30
      ├─ Loop 1: Generate → Review → 7 pass, 3 fail
      ├─ Loop 2: Fix 3 → Review → 2 pass, 1 fail
      ├─ Loop 3: Fix 1 → Review → All pass! ✅
```

### **Result**
```
✅ 30/30 questions processed
📁 Output: SPSS_output_R79641.sps
```

---

## 🔧 Key Components Explained Simply

### **AsyncTransformerAgent**
- **Job**: Write SPSS code
- **Input**: Questions + Training examples
- **Output**: SPSS scripts
- **How**: Calls OpenAI API with a prompt

### **AsyncReviewerAgent**
- **Job**: Check if code is correct
- **Input**: Generated code + Expected logic
- **Output**: Pass/Fail + Feedback
- **How**: Calls OpenAI API to review

### **AsyncMultiAgentPipeline**
- **Job**: Orchestrate everything
- **Does**: 
  - Splits questions into batches
  - Runs batches in parallel
  - Manages the feedback loop
  - Collects results
  - Writes output files

### **LearningMemoryManager**
- **Job**: Remember mistakes and fixes
- **Stores**: 
  - Common failures
  - Successful fixes
  - Patterns to avoid
- **Uses**: This knowledge for future questions

---

## 💡 Why This Design?

### **Parallel Processing**
- **Problem**: Processing 100 questions one-by-one takes forever
- **Solution**: Process 10 batches of 10 questions simultaneously
- **Result**: 10x faster!

### **Feedback Loop**
- **Problem**: AI sometimes makes mistakes
- **Solution**: Check the code, give feedback, fix it
- **Result**: Higher quality output

### **Batching**
- **Problem**: Each question needs training examples (expensive)
- **Solution**: Share training examples across a batch
- **Result**: Saves money and tokens

### **Learning Memory**
- **Problem**: Same mistakes keep happening
- **Solution**: Remember what worked before
- **Result**: Gets smarter over time

---

## 🎬 Real-World Analogy

Think of it like a **code review process**:

1. **Developer (Transformer)**: Writes code
2. **Reviewer (Reviewer)**: Checks the code
3. **Feedback**: "This line is wrong, fix it like this"
4. **Developer**: Fixes the code
5. **Reviewer**: Checks again
6. **Repeat** until approved

But instead of humans, it's AI agents doing this automatically for hundreds of questions!

---

## 📝 Summary

**multi_batch_2.py** is a smart system that:

1. ✅ Takes survey questions
2. ✅ Splits them into batches
3. ✅ Processes batches in parallel (fast!)
4. ✅ Uses two AI agents (Writer + Checker)
5. ✅ Has a feedback loop to fix mistakes
6. ✅ Learns from past mistakes
7. ✅ Outputs validated SPSS code

It's like having an automated code generation and review system that gets better over time!


