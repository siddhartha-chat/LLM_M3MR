#!/bin/bash

# Run multiagentic_batch_efficient.py in FOREGROUND (terminal must stay open)
# This version keeps the process in foreground for real-time monitoring

echo "============================================================"
echo "Multi-Agent Batch Processor (multiagentic_batch_efficient.py)"
echo "Sleep Prevention: ENABLED"
echo "Mode: FOREGROUND (terminal must stay open)"
echo "============================================================"

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Check if virtual environment exists
if [ ! -d "../.venv" ]; then
    echo "❌ Error: Virtual environment not found at ../.venv"
    exit 1
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source ../.venv/bin/activate

# Check if openai package is installed
if ! python -c "import openai" 2>/dev/null; then
    echo "❌ Error: openai package not installed"
    exit 1
fi

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "⚠️  Warning: .env file not found"
    exit 1
fi

# Check if generation directory has files
if [ ! -d "generation" ] || [ -z "$(ls -A generation/*.md 2>/dev/null)" ]; then
    echo "⚠️  Warning: No .md files found in generation/ directory"
    exit 1
fi

# Check if multiagentic_batch_efficient.py exists
if [ ! -f "multiagentic_batch_efficient.py" ]; then
    echo "❌ Error: multiagentic_batch_efficient.py not found"
    exit 1
fi

# Run in FOREGROUND with caffeinate
echo "🚀 Running multiagentic_batch_efficient.py..."
echo "   ⚠️  WARNING: Keep this terminal open!"
echo "   💡 Your Mac will stay awake until the process completes"
echo ""
caffeinate -i python multiagentic_batch_efficient.py "$@"

# Capture exit code
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    echo ""
    echo "============================================================"
    echo "✅ Processing completed successfully!"
    echo "============================================================"
else
    echo ""
    echo "============================================================"
    echo "❌ Processing failed with exit code: $EXIT_CODE"
    echo "============================================================"
fi

exit $EXIT_CODE

