# How to Run the SPSS Batch Processor

This guide explains how to run `main.py` correctly with the virtual environment activated.

---

## 🚨 The Problem

If you see this error:
```
ModuleNotFoundError: No module named 'openai'
```

It means you're running the script **without activating the virtual environment**.

---

## ✅ Solution: 3 Easy Ways to Run

### **Method 1: Use the Run Script (Easiest)** ⭐

I've created a helper script that does everything for you:

```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
./run.sh
```

This script will:
- ✅ Activate the virtual environment automatically
- ✅ Check if required packages are installed
- ✅ Check if .env file exists
- ✅ Run main.py
- ✅ Show success/error messages

---

### **Method 2: Manual Activation (Recommended for Development)**

Run these commands step-by-step:

```bash
# 1. Navigate to the project directory
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR

# 2. Activate the virtual environment
source ../.venv/bin/activate

# 3. Run the script
python main.py
```

**Your prompt should show `(agents)` when the virtual environment is active:**
```bash
(agents) sidchatterjee@Siddharthas-MacBook-Pro LLM_M3MR %
```

---

### **Method 3: One-Line Command**

If you want to run it without activating (not recommended for development):

```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR && source ../.venv/bin/activate && python main.py
```

---

## 🔍 Verify Your Setup

### Check if Virtual Environment is Active

Your terminal prompt should show:
```bash
(agents) sidchatterjee@Siddharthas-MacBook-Pro LLM_M3MR %
      ↑
This indicates the virtual environment is active
```

### Check if OpenAI is Installed

```bash
python -c "import openai; print(f'OpenAI version: {openai.__version__}')"
```

Expected output:
```
OpenAI version: 1.100.2
```

### Check if .env File Exists

```bash
ls -la .env
```

If it doesn't exist, create it:
```bash
cp env.example.txt .env
# Then edit .env and add your OpenAI API key
```

---

## 📝 Required Files Checklist

Before running, make sure you have:

- ✅ `.env` file with your OpenAI API key
- ✅ `training/` directory with .md files
- ✅ `macros/` directory with macro.txt
- ✅ `generation/` directory with .md files to process
- ✅ `prompts/system/` with system_prompt.txt
- ✅ `prompts/user/` with generation_prompt.txt

---

## 🎯 Step-by-Step First Run

### Step 1: Create .env File

```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR

# Copy the example template
cat env.example.txt > .env

# Edit with your favorite editor
nano .env  # or: vim .env, or: code .env
```

Add your OpenAI API key:
```bash
OPENAI_API_KEY=sk-proj-your_actual_key_here
MODEL=gpt-4o-mini
BATCH_SIZE=5
MAX_BATCHES=1  # Start with 1 batch for testing
```

### Step 2: Activate Virtual Environment

```bash
source ../.venv/bin/activate
```

You should see `(agents)` in your prompt.

### Step 3: Test with One Batch

Make sure your .env has:
```bash
MAX_BATCHES=1
```

### Step 4: Run the Script

```bash
python main.py
```

Or use the helper script:
```bash
./run.sh
```

---

## 🐛 Troubleshooting

### Error: `ModuleNotFoundError: No module named 'openai'`

**Problem:** Virtual environment is not activated

**Solution:**
```bash
source ../.venv/bin/activate
python main.py
```

---

### Error: `OpenAI API key not found`

**Problem:** Missing or incorrect .env file

**Solution:**
```bash
# Check if .env exists
ls -la .env

# Create it if missing
cp env.example.txt .env

# Edit and add your API key
nano .env
```

---

### Error: `Training directory not found`

**Problem:** Missing required directories

**Solution:**
```bash
# Check directory structure
ls -la

# Make sure you have:
# - training/
# - macros/
# - generation/
# - prompts/
```

---

### Virtual Environment Not Found

**Problem:** The ../.venv directory doesn't exist

**Solution:**
```bash
# Create a new virtual environment
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents
python3 -m venv .venv

# Activate it
source .venv/bin/activate

# Install required packages
pip install openai python-dotenv
```

---

## 💡 Pro Tips

### Keep Virtual Environment Active

When developing, keep the virtual environment active for your entire session:

```bash
# Activate once
source ../.venv/bin/activate

# Now you can run the script multiple times
python main.py
python main.py
python main.py

# When done, deactivate (optional)
deactivate
```

### Create an Alias

Add to your `~/.zshrc`:

```bash
alias spss-run='cd "/Users/sidchatterjee/Documents/Coding Enthuziast/agents/LLM_M3MR" && source ../.venv/bin/activate && python main.py'
```

Then you can just run:
```bash
spss-run
```

### VS Code Integration

If using VS Code:
1. Open the project folder
2. Press `Cmd+Shift+P`
3. Type "Python: Select Interpreter"
4. Choose the interpreter from `../.venv/bin/python`

Now VS Code will use the correct virtual environment automatically.

---

## 🚀 Quick Reference

**Run with virtual environment (recommended):**
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
python main.py
```

**Or use the helper script:**
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
./run.sh
```

**Check if virtual env is active:**
- Look for `(agents)` in your terminal prompt
- Run: `which python` → should show path with `.venv`

**Deactivate virtual environment:**
```bash
deactivate
```

---

## 📞 Need Help?

1. Make sure virtual environment is activated (look for `(agents)` in prompt)
2. Make sure .env file exists and has your OpenAI API key
3. Check that all required directories exist (training, macros, generation, prompts)
4. Try running `./run.sh` which does all the checks for you

---

## ✅ Summary

**The key takeaway:** Always activate the virtual environment before running the script!

```bash
source ../.venv/bin/activate  # ← THIS IS CRITICAL
python main.py
```

Or just use the helper script:
```bash
./run.sh  # Does everything for you
```



