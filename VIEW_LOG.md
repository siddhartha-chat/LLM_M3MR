# Where to Find Log Files

## 📁 Log File Location

Log files are created in the **LLM_M3MR directory**:

```
/Users/sidchatterjee/Documents/Coding Enthuziast/agents/LLM_M3MR/
```

## 📄 Log File Naming

Log files are named with timestamp:
```
multiagentic_batch_efficient_YYYYMMDD_HHMMSS.log
```

**Example:**
```
multiagentic_batch_efficient_20251212_103422.log
```

## 🔍 How to Find Log Files

### **Method 1: List all log files**
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
ls -lth multiagentic_batch_efficient_*.log
```

### **Method 2: Find most recent log file**
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
ls -t multiagentic_batch_efficient_*.log | head -1
```

### **Method 3: View log file**
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
tail -f multiagentic_batch_efficient_*.log
```

## 📊 How to View Log Files

### **View entire log file:**
```bash
cat multiagentic_batch_efficient_20251212_103422.log
```

### **View last 50 lines:**
```bash
tail -50 multiagentic_batch_efficient_20251212_103422.log
```

### **Monitor log in real-time (follow):**
```bash
tail -f multiagentic_batch_efficient_20251212_103422.log
```

### **View with line numbers:**
```bash
cat -n multiagentic_batch_efficient_20251212_103422.log
```

### **Search for errors:**
```bash
grep -i error multiagentic_batch_efficient_*.log
grep -i "batch.*complete" multiagentic_batch_efficient_*.log
```

## 🎯 Quick Commands

### **Find latest log:**
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
LATEST_LOG=$(ls -t multiagentic_batch_efficient_*.log | head -1)
echo "Latest log: $LATEST_LOG"
tail -f "$LATEST_LOG"
```

### **View all logs:**
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
ls -lth multiagentic_batch_efficient_*.log
```

### **Check if process is still running:**
```bash
ps aux | grep multiagentic_batch_efficient
```

## 📝 Note

When you run the script, it will:
1. Create a new log file with current timestamp
2. Print the log file name in the terminal
3. Save all output to that log file

The log file is created in the **same directory** where you run the script (LLM_M3MR directory).

