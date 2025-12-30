# Troubleshooting: Script Stopped After 7 Batches

## 🔍 Possible Reasons

### **1. MAX_BATCHES Environment Variable Set** ⭐ Most Likely

If you have `MAX_BATCHES=7` in your `.env` file, the script will stop after 7 batches.

**Check:**
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
grep MAX_BATCHES .env
```

**Fix:**
- Remove `MAX_BATCHES` from `.env` to process all batches
- Or set `MAX_BATCHES=` (empty) to remove the limit

---

### **2. Exception/Error During Batch 8**

The script terminates if an exception occurs during batch processing (see lines 498-516).

**Check the terminal output for:**
```
❌ Error processing batch 8: [error message]
⚠️  Writing X successful outputs before terminating...
❌ Terminating execution after batch 8 error
```

**Common errors:**
- API rate limit exceeded
- API timeout
- Network connection issues
- Invalid response from OpenAI
- Out of memory

**Fix:**
- Check the error message in terminal
- Review the traceback output
- Check OpenAI API status
- Verify your API key is valid

---

### **3. Only 7 Batches Total**

If your file only has 70 questions and `MAX_QUESTIONS=10` (batch size), there are exactly 7 batches.

**Check:**
```bash
# Count questions in your file
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
# Check the output logs to see total questions
```

**Calculation:**
- If `MAX_QUESTIONS=10` and you have 70 questions
- Number of batches = 70 ÷ 10 = 7 batches
- Script completes normally after 7 batches ✅

---

### **4. API Rate Limit or Timeout**

OpenAI API might have rate-limited or timed out during batch 8.

**Check:**
- Look for rate limit errors in terminal
- Check OpenAI dashboard for API status
- Verify your API tier limits

**Fix:**
- Wait and retry
- Reduce batch size
- Add delays between batches

---

### **5. Terminal/System Timeout**

Even with `caffeinate`, there might be other timeouts.

**Check:**
- Did the terminal show any timeout messages?
- Was the script still running or did it exit?

**Fix:**
- Ensure `caffeinate` is working
- Check system sleep settings
- Run in background with `nohup`

---

## 🔧 How to Diagnose

### **Step 1: Check Your .env File**
```bash
cd /Users/sidchatterjee/Documents/Coding\ Enthuziast/agents/LLM_M3MR
cat .env | grep -i batch
```

Look for:
- `MAX_BATCHES=7` ← This would cause it to stop
- `MAX_QUESTIONS=10` ← This is batch size

### **Step 2: Check Terminal Output**
Look for these messages:

**If it completed normally:**
```
FILE PROCESSING COMPLETE: [filename]
  Total questions processed: X/Y
```

**If it stopped due to error:**
```
❌ Error processing batch 8: [error]
⚠️  Writing X successful outputs before terminating...
❌ Terminating execution after batch 8 error
```

**If it hit MAX_BATCHES limit:**
```
⚠️  Reached max batch limit (7). Stopping batch creation.
```

### **Step 3: Check Output Files**
```bash
ls -lh output/SPSS_output_*.sps
ls -lh output/review_reports/
```

- If files exist, check how many questions were processed
- Review any error logs

---

## ✅ Solutions

### **Solution 1: Remove MAX_BATCHES Limit**

Edit `.env` file:
```bash
# Remove or comment out MAX_BATCHES
# MAX_BATCHES=7  ← Comment this out

# Or set to empty
MAX_BATCHES=
```

### **Solution 2: Process All Batches**

If you want to process all batches:
```bash
# In .env file
MAX_BATCHES=        # Leave empty or remove
MAX_QUESTIONS=10    # Your batch size
```

### **Solution 3: Fix Error and Continue**

If there was an error:
1. Check the error message
2. Fix the issue (API key, network, etc.)
3. Re-run the script
4. The script will start from the beginning (it doesn't resume)

### **Solution 4: Process Remaining Batches Manually**

If you need to process batches 8+ separately:
1. Note which questions were already processed
2. Create a new file with only unprocessed questions
3. Run the script on that file

---

## 📊 Understanding Batch Processing

### **How Batches Are Calculated:**
```
Number of Batches = (Total Questions + Batch Size - 1) ÷ Batch Size
```

**Examples:**
- 70 questions, batch size 10 → 7 batches ✅
- 75 questions, batch size 10 → 8 batches
- 100 questions, batch size 10 → 10 batches

### **How MAX_BATCHES Works:**
```
If MAX_BATCHES is set:
  Process only first MAX_BATCHES batches
  Stop after that, even if more batches exist
```

**Example:**
- 100 questions, batch size 10 → 10 batches total
- MAX_BATCHES=7 → Process only batches 1-7 (70 questions)
- Batches 8-10 are skipped

---

## 🎯 Quick Fixes

### **Fix 1: Process All Batches**
```bash
# Edit .env
MAX_BATCHES=        # Remove the limit
```

### **Fix 2: Check for Errors**
```bash
# Re-run and watch for errors
./run_multiagentic_batch_efficient.sh
```

### **Fix 3: Verify Total Questions**
```bash
# Check how many questions are in your file
# The script prints this at the start
```

---

## 📝 Code Reference

The script stops early in these cases:

1. **MAX_BATCHES limit reached** (if set in SPSSBatchProcessor)
2. **Exception during batch processing** (lines 498-516):
   ```python
   except Exception as e:
       print(f"\n❌ Error processing batch {batch_idx + 1}: {e}")
       # ... error handling ...
       print(f"\n❌ Terminating execution after batch {batch_idx + 1} error")
       return  # ← Stops here
   ```
3. **All batches completed** (normal completion)

---

## 💡 Prevention Tips

1. **Check .env before running:**
   ```bash
   cat .env | grep MAX_BATCHES
   ```

2. **Monitor terminal output:**
   - Watch for error messages
   - Note which batch it stops at

3. **Use logging:**
   - Check `output/review_reports/` for batch logs
   - Review error details

4. **Test with small batches first:**
   ```bash
   MAX_BATCHES=1  # Test with 1 batch
   # If successful, remove limit
   ```

---

## 🔍 Still Having Issues?

1. **Check the exact error message** in terminal
2. **Review output files** to see what was processed
3. **Check your .env file** for MAX_BATCHES setting
4. **Verify total questions** in your input file
5. **Check OpenAI API status** and your account limits

