# LLM M3MR - Multi-Agent SPSS Script Generator

## 📋 Overview

A multi-agent system that automatically generates SPSS validation scripts from survey questions using LLM-based Transformer and Reviewer agents with iterative feedback loops.

## 🚀 Quick Start

### 1. Clone This Repository

```bash
git clone <YOUR_GIT_URL>
cd LLM_M3MR
```

### 2. Setup Environment

Create a `.env` file in the root directory:

```bash
# OpenAI API Configuration
OPENAI_API_KEY=your_api_key_here
MODEL=gpt-5-mini  # or gpt-4o-mini

# Batch Processing
MAX_QUESTIONS=10
MAX_FEEDBACK_LOOPS=7

# Rate Limiting
GLOBAL_RATE_LIMIT_DELAY=7.0
MAX_CONCURRENT_REQUESTS=1

# Token Limits
MAX_COMPLETION_TOKENS_TRANSFORMER=10000
MAX_COMPLETION_TOKENS_REVIEWER=15000
TRAINING_CONTEXT_FIRST_BATCH_CHARS=80000
TRAINING_CONTEXT_OTHER_BATCH_CHARS=60000

# Advanced Features
ENABLE_LEARNING_MEMORY=true
ENABLE_SMART_RETRIES=true
PROGRESSIVE_CONTEXT_REDUCTION=true
ENABLE_COT=false
ENABLE_ANTI_PATTERNS=true
```

### 3. Install Dependencies

```bash
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install openai python-dotenv
```

### 4. Place Input Files

Add your survey question files to `generation/` directory in the expected format.

### 5. Run the Pipeline

```bash
# Option 1: Basic version
python multi_batch_1.py

# Option 2: Enhanced version (with timeout/batch splitting)
python multi_batch_2.py
```

## 📁 Project Structure

```
LLM_M3MR/
├── multi_batch_1.py          # Basic multi-agent pipeline
├── multi_batch_2.py          # Enhanced with timeout/splitting
├── main.py                   # Core utilities
├── generation/               # Input survey question files
├── output/                   # Generated SPSS scripts
├── training/                 # Training data files
├── prompts/                  # LLM prompt templates
│   ├── user/                # Generation/regeneration prompts
│   ├── reviewer/            # Review prompts
│   └── system/              # System prompts
├── macros/                   # SPSS macro definitions
├── execution_obsolete/       # Old version scripts
└── purge/                    # Documentation/archives
```

## ✨ Features

### Multi-Agent Architecture
- **Transformer Agent**: Generates SPSS validation scripts from questions
- **Reviewer Agent**: Reviews logic correctness and provides feedback
- **Feedback Loop**: Iterative refinement based on reviewer feedback

### Key Capabilities
- ✅ Batch processing for large datasets
- ✅ Parallel execution (10 batches at a time)
- ✅ Learning memory system (records failures/successes)
- ✅ Anti-pattern recognition
- ✅ Chain-of-thought reasoning
- ✅ Progressive context reduction
- ✅ Empty output handling
- ✅ API call timeout protection

## 🔧 Configuration

All settings can be adjusted via environment variables in `.env`:

| Variable | Default | Description |
|---------|---------|-------------|
| `MODEL` | `gpt-5-mini` | OpenAI model to use |
| `MAX_QUESTIONS` | `10` | Questions per batch |
| `MAX_FEEDBACK_LOOPS` | `7` | Max regeneration attempts |
| `GLOBAL_RATE_LIMIT_DELAY` | `7.0` | Seconds between API calls |
| `MAX_COMPLETION_TOKENS_TRANSFORMER` | `10000` | Max output tokens for generation |
| `MAX_COMPLETION_TOKENS_REVIEWER` | `15000` | Max output tokens for review |

## 📤 Output

Generated SPSS scripts are written to:
- `output/SPSS_output_<PROJECT_ID>.sps`
- `output/review_reports/` - Detailed review logs

## ⚠️ Important Notes

1. **No `.env` file included** - You must create your own with your API keys
2. **Rate Limits**: Adjust `GLOBAL_RATE_LIMIT_DELAY` based on your OpenAI tier
3. **Token Limits**: Configure based on your model's capabilities
4. **Input Format**: Survey questions must follow the expected format (see `generation/` examples)

## 📚 Documentation

- `execution_obsolete/` - Previous version scripts for reference
- `purge/` - Additional documentation and guides

## 🤝 Contributing

Feel free to fork, modify, and share improvements!

## 📄 License

See LICENSE file for details.

---

**Last Updated:** October 2024  
**Author:** Siddhartha Chatterjee

