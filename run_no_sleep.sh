#!/bin/bash

# SPSS Batch Processor - Run Script with Sleep Prevention
# This script prevents the Mac from sleeping while running the process

echo "============================================================"
echo "SPSS Batch Processor - Starting (Sleep Prevention Enabled)"
echo "============================================================"

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Check if virtual environment exists
if [ ! -d "../.venv" ]; then
    echo "❌ Error: Virtual environment not found at ../.venv"
    echo ""
    echo "Please create a virtual environment first:"
    echo "  python3 -m venv ../.venv"
    echo "  source ../.venv/bin/activate"
    echo "  pip install openai python-dotenv"
    exit 1
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source ../.venv/bin/activate

# Check if openai package is installed
if ! python -c "import openai" 2>/dev/null; then
    echo "❌ Error: openai package not installed"
    echo ""
    echo "Please install required packages:"
    echo "  source ../.venv/bin/activate"
    echo "  pip install openai python-dotenv"
    exit 1
fi

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "⚠️  Warning: .env file not found"
    echo ""
    echo "Please create a .env file with your OpenAI API key:"
    echo "  OPENAI_API_KEY=your_key_here"
    echo "  MODEL=gpt-4o-mini"
    echo ""
    echo "See env.example.txt for a template"
    exit 1
fi

# Run the main script with caffeinate to prevent sleep
# -i: Prevent idle sleep (keeps system awake while command runs)
echo "🚀 Running with sleep prevention (caffeinate)..."
echo "   💡 Your Mac will stay awake until the process completes"
echo ""
caffeinate -i python main.py "$@"

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

