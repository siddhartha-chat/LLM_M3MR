# Environment Variables for multiagentic_batch_efficient.py

This document lists all environment variables that `multiagentic_batch_efficient.py` uses.

---

## 🔑 Required Environment Variables

### **OPENAI_API_KEY**
- **Required:** Yes
- **Description:** Your OpenAI API key
- **Example:** `OPENAI_API_KEY=sk-your-api-key-here`
- **Used by:** `SPSSBatchProcessor` (from main.py)

---

## ⚙️ Configuration Environment Variables

### **MODEL**
- **Required:** No (has default)
- **Default:** `gpt-4o-mini`
- **Description:** OpenAI model to use for generation
- **Options:** `gpt-4o`, `gpt-4o-mini`, `gpt-4-turbo`, `o1`, `o3`, etc.
- **Example:** `MODEL=gpt-4o-mini`
- **Used by:** `SPSSBatchProcessor` (from main.py)

### **MAX_FEEDBACK_LOOPS**
- **Required:** No (has default)
- **Default:** `5`
- **Description:** Maximum number of feedback loops (generate → review → fix cycles)
- **Example:** `MAX_FEEDBACK_LOOPS=7`
- **Used by:** `multiagentic_batch_efficient.py` directly

### **MAX_QUESTIONS** (used as BATCH_SIZE)
- **Required:** No (has default)
- **Default:** `10`
- **Description:** Number of questions to process per batch
- **Note:** This variable is reused as `BATCH_SIZE` in the script
- **Example:** `MAX_QUESTIONS=10`
- **Used by:** `multiagentic_batch_efficient.py` directly

### **BATCH_SIZE**
- **Required:** No (has default)
- **Default:** `5` (from SPSSBatchProcessor)
- **Description:** Questions per batch (used by SPSSBatchProcessor, but MAX_QUESTIONS overrides it)
- **Note:** `MAX_QUESTIONS` takes precedence in this script
- **Example:** `BATCH_SIZE=5`
- **Used by:** `SPSSBatchProcessor` (from main.py)

### **MAX_BATCHES**
- **Required:** No
- **Default:** `None` (unlimited)
- **Description:** Maximum number of batches to process (useful for testing/limiting)
- **Example:** `MAX_BATCHES=3` (process only 3 batches)
- **Used by:** `SPSSBatchProcessor` (from main.py)

### **INCLUDE_TRAINING_IN_ALL**
- **Required:** No (has default)
- **Default:** `true`
- **Description:** Whether to include full training context in all batches
  - `true`: All batches get full training context (more tokens, potentially better quality)
  - `false`: Only first batch gets full training context (saves tokens)
- **Example:** `INCLUDE_TRAINING_IN_ALL=false`
- **Used by:** Both `multiagentic_batch_efficient.py` and `SPSSBatchProcessor`

### **TRAINING_CONTEXT_FIRST_BATCH_CHARS**
- **Required:** No (has default)
- **Default:** `60000`
- **Description:** Maximum characters of training context for the first batch
- **Example:** `TRAINING_CONTEXT_FIRST_BATCH_CHARS=60000`
- **Used by:** `multiagentic_batch_efficient.py` directly

### **TRAINING_CONTEXT_OTHER_BATCH_CHARS**
- **Required:** No (has default)
- **Default:** `5000`
- **Description:** Maximum characters of training context for batches after the first
- **Example:** `TRAINING_CONTEXT_OTHER_BATCH_CHARS=5000`
- **Used by:** `multiagentic_batch_efficient.py` directly

### **MAX_COMPLETION_TOKENS_TRANSFORMER**
- **Required:** No (has default)
- **Default:** `5000`
- **Description:** Maximum completion tokens for the Transformer agent (code generation)
- **Example:** `MAX_COMPLETION_TOKENS_TRANSFORMER=5000`
- **Used by:** `multiagentic_batch_efficient.py` directly

### **MAX_COMPLETION_TOKENS_REVIEWER**
- **Required:** No (has default)
- **Default:** `16000`
- **Description:** Maximum completion tokens for the Reviewer agent (code review)
- **Example:** `MAX_COMPLETION_TOKENS_REVIEWER=16000`
- **Used by:** `multiagentic_batch_efficient.py` directly

### **INPUT_FILE_NAME**
- **Required:** No (has default)
- **Default:** `""` (empty - processes all files)
- **Description:** Specific file to process from the `generation/` directory
- **Example:** `INPUT_FILE_NAME=R79641.md`
- **Note:** If empty, processes all `.md` files in `generation/` directory
- **Used by:** `multiagentic_batch_efficient.py` directly

---

## 📋 Complete .env File Template

Here's a complete `.env` file template with all available options:

```bash
# ============================================================
# Required: OpenAI API Key
# ============================================================
OPENAI_API_KEY=sk-your-api-key-here

# ============================================================
# Model Selection
# ============================================================
MODEL=gpt-4o-mini

# ============================================================
# Batch Configuration
# ============================================================
MAX_QUESTIONS=10                    # Questions per batch (used as BATCH_SIZE)
MAX_FEEDBACK_LOOPS=5                # Maximum feedback loop iterations
MAX_BATCHES=                        # Optional: Limit number of batches (leave empty for unlimited)

# ============================================================
# Training Context Configuration
# ============================================================
INCLUDE_TRAINING_IN_ALL=true        # true = all batches get training, false = only first batch
TRAINING_CONTEXT_FIRST_BATCH_CHARS=60000
TRAINING_CONTEXT_OTHER_BATCH_CHARS=5000

# ============================================================
# Token Limits
# ============================================================
MAX_COMPLETION_TOKENS_TRANSFORMER=5000
MAX_COMPLETION_TOKENS_REVIEWER=16000

# ============================================================
# Input File Configuration
# ============================================================
INPUT_FILE_NAME=                    # Specific file to process, or leave empty for all files
```

---

## 🎯 Quick Reference

| Variable | Required | Default | Purpose |
|----------|----------|---------|---------|
| `OPENAI_API_KEY` | ✅ Yes | - | OpenAI API key |
| `MODEL` | No | `gpt-4o-mini` | Model to use |
| `MAX_FEEDBACK_LOOPS` | No | `5` | Max feedback loops |
| `MAX_QUESTIONS` | No | `10` | Batch size |
| `MAX_BATCHES` | No | `None` | Limit batches |
| `INCLUDE_TRAINING_IN_ALL` | No | `true` | Training in all batches |
| `TRAINING_CONTEXT_FIRST_BATCH_CHARS` | No | `60000` | First batch context size |
| `TRAINING_CONTEXT_OTHER_BATCH_CHARS` | No | `5000` | Other batches context size |
| `MAX_COMPLETION_TOKENS_TRANSFORMER` | No | `5000` | Transformer token limit |
| `MAX_COMPLETION_TOKENS_REVIEWER` | No | `16000` | Reviewer token limit |
| `INPUT_FILE_NAME` | No | `""` | Specific file to process |

---

## 💡 Example Configurations

### **Minimal Configuration (Required Only)**
```bash
OPENAI_API_KEY=sk-your-key-here
```

### **Quick Test Configuration**
```bash
OPENAI_API_KEY=sk-your-key-here
MODEL=gpt-4o-mini
MAX_QUESTIONS=5
MAX_FEEDBACK_LOOPS=2
INPUT_FILE_NAME=R79641.md
```

### **Production Configuration**
```bash
OPENAI_API_KEY=sk-your-key-here
MODEL=gpt-4o-mini
MAX_QUESTIONS=10
MAX_FEEDBACK_LOOPS=7
INCLUDE_TRAINING_IN_ALL=false
TRAINING_CONTEXT_FIRST_BATCH_CHARS=60000
TRAINING_CONTEXT_OTHER_BATCH_CHARS=5000
MAX_COMPLETION_TOKENS_TRANSFORMER=5000
MAX_COMPLETION_TOKENS_REVIEWER=16000
```

### **Cost-Optimized Configuration**
```bash
OPENAI_API_KEY=sk-your-key-here
MODEL=gpt-4o-mini
MAX_QUESTIONS=10
INCLUDE_TRAINING_IN_ALL=false    # Saves tokens
TRAINING_CONTEXT_FIRST_BATCH_CHARS=40000
TRAINING_CONTEXT_OTHER_BATCH_CHARS=3000
MAX_COMPLETION_TOKENS_TRANSFORMER=4000
MAX_COMPLETION_TOKENS_REVIEWER=12000
```

---

## 📝 Notes

1. **MAX_QUESTIONS vs BATCH_SIZE**: The script uses `MAX_QUESTIONS` as the batch size, overriding `BATCH_SIZE` from `SPSSBatchProcessor`.

2. **INCLUDE_TRAINING_IN_ALL**: Setting this to `false` can significantly reduce token usage and costs, especially for large datasets.

3. **INPUT_FILE_NAME**: If you want to process a specific file, set this. Leave it empty or unset to process all `.md` files in the `generation/` directory.

4. **MAX_BATCHES**: Useful for testing - limits how many batches to process. Leave empty or unset for unlimited.

5. **Token Limits**: Adjust based on your model and question complexity. Higher limits allow for more detailed outputs but cost more.

---

## 🔍 How Variables Are Used

### **Direct Usage (in multiagentic_batch_efficient.py):**
- `MAX_FEEDBACK_LOOPS`
- `MAX_QUESTIONS` (as BATCH_SIZE)
- `INCLUDE_TRAINING_IN_ALL`
- `TRAINING_CONTEXT_FIRST_BATCH_CHARS`
- `TRAINING_CONTEXT_OTHER_BATCH_CHARS`
- `MAX_COMPLETION_TOKENS_TRANSFORMER`
- `MAX_COMPLETION_TOKENS_REVIEWER`
- `INPUT_FILE_NAME`

### **Indirect Usage (via SPSSBatchProcessor from main.py):**
- `OPENAI_API_KEY`
- `MODEL`
- `BATCH_SIZE` (but MAX_QUESTIONS overrides it)
- `MAX_BATCHES`
- `INCLUDE_TRAINING_IN_ALL` (also checked directly)


