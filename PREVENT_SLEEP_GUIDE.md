# Preventing Mac Sleep During Long-Running Processes

This guide explains how to prevent your Mac from going to sleep while running long processes in the LLM_M3MR project.

## 🎯 Quick Solutions

### **Option 1: Use the Sleep Prevention Script (Easiest)** ⭐

I've created a script that automatically prevents sleep:

```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
./run_no_sleep.sh
```

This script uses `caffeinate` to keep your Mac awake until the process completes.

---

### **Option 2: Use `caffeinate` Manually**

Run your Python script with `caffeinate`:

```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
caffeinate -i -w python multi_batch_2.py
```

**Flags explained:**
- `-i`: Prevent idle sleep (keeps system awake)
- `-w`: Wait for the process to exit (caffeinate exits when Python finishes)

**For a specific duration:**
```bash
caffeinate -i -t 3600 python multi_batch_2.py  # Stay awake for 1 hour (3600 seconds)
```

---

### **Option 3: Use `nohup` + Background Process**

Run in background and prevent sleep:

```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
nohup caffeinate -i python multi_batch_2.py > output.log 2>&1 &
```

This will:
- Run in background (`&`)
- Continue even if terminal closes (`nohup`)
- Prevent sleep (`caffeinate -i`)
- Save output to `output.log`

**Check progress:**
```bash
tail -f output.log
```

**Stop the process:**
```bash
pkill -f multi_batch_2.py
```

---

### **Option 4: Use `screen` or `tmux`**

These terminal multiplexers keep sessions alive:

**Using `screen`:**
```bash
# Install if needed: brew install screen
screen -S llm_process
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
caffeinate -i python multi_batch_2.py

# Detach: Press Ctrl+A, then D
# Reattach: screen -r llm_process
```

**Using `tmux`:**
```bash
# Install if needed: brew install tmux
tmux new -s llm_process
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
caffeinate -i python multi_batch_2.py

# Detach: Press Ctrl+B, then D
# Reattach: tmux attach -t llm_process
```

---

### **Option 5: System Settings (Manual)**

You can also change macOS system settings:

1. **System Settings** → **Battery** → **Options**
   - Set "Prevent automatic sleeping on power adapter when display is off" to ON

2. **System Settings** → **Lock Screen**
   - Increase "Turn display off after" to a longer time or "Never"

⚠️ **Note:** This affects all processes, not just your script.

---

## 📋 Comparison Table

| Method | Prevents Sleep | Survives Terminal Close | Easy to Use | Best For |
|--------|---------------|-------------------------|-------------|----------|
| `run_no_sleep.sh` | ✅ | ❌ | ⭐⭐⭐⭐⭐ | Quick runs |
| `caffeinate` manual | ✅ | ❌ | ⭐⭐⭐⭐ | One-time runs |
| `nohup` + `caffeinate` | ✅ | ✅ | ⭐⭐⭐ | Background jobs |
| `screen`/`tmux` | ✅* | ✅ | ⭐⭐⭐ | Long sessions |
| System Settings | ✅ | ✅ | ⭐⭐ | Always-on setup |

*Requires `caffeinate` inside the session

---

## 🔧 Advanced: Caffeinate Options

```bash
# Prevent idle sleep only
caffeinate -i python script.py

# Prevent idle sleep + wait for process
caffeinate -i -w python script.py

# Prevent idle sleep + display sleep
caffeinate -i -d python script.py

# Prevent all sleep types
caffeinate -i -d -m -s python script.py

# For a specific duration (in seconds)
caffeinate -i -t 7200 python script.py  # 2 hours
```

**Flag meanings:**
- `-i`: Prevent idle sleep
- `-d`: Prevent display sleep
- `-m`: Prevent disk sleep
- `-s`: Prevent system sleep
- `-w`: Wait for process to exit
- `-t`: Time limit in seconds

---

## 💡 Recommended Workflow

For your LLM_M3MR project, I recommend:

1. **For quick test runs:** Use `./run_no_sleep.sh`
2. **For long production runs:** Use `nohup caffeinate -i python multi_batch_2.py > output.log 2>&1 &`
3. **For interactive monitoring:** Use `screen` or `tmux` with `caffeinate`

---

## 🐛 Troubleshooting

**Q: Process still stops when I close terminal?**
A: Use `nohup` or `screen`/`tmux` to keep it running.

**Q: Mac still goes to sleep?**
A: Make sure you're using `-i` flag with `caffeinate`. Also check System Settings → Battery.

**Q: How do I check if a process is still running?**
A: Use `ps aux | grep multi_batch_2.py` or `tail -f output.log`

**Q: How do I stop a background process?**
A: Find the PID: `ps aux | grep multi_batch_2.py`, then `kill <PID>`

---

## 📝 Example: Running multi_batch_2.py

```bash
# Method 1: Simple (terminal must stay open)
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
caffeinate -i -w python multi_batch_2.py

# Method 2: Background (can close terminal)
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
nohup caffeinate -i python multi_batch_2.py > multi_batch_2.log 2>&1 &

# Method 3: With screen (can detach/reattach)
screen -S llm_batch
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
source ../.venv/bin/activate
caffeinate -i python multi_batch_2.py
# Press Ctrl+A then D to detach
# Later: screen -r llm_batch to reattach
```


