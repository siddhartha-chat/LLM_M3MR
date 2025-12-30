#!/bin/bash

# Run multi_batch_2.py with sleep prevention
# This script activates the virtual environment and runs multi_batch_2.py

echo "============================================================"
echo "Multi-Agent Batch Processor (multi_batch_2.py)"
echo "Sleep Prevention: ENABLED"
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
    echo "See purge/env.example.txt for a template"
    exit 1
fi

# Check if generation directory has files
if [ ! -d "generation" ] || [ -z "$(ls -A generation/*.md 2>/dev/null)" ]; then
    echo "⚠️  Warning: No .md files found in generation/ directory"
    echo ""
    echo "Please add generation files to process"
    exit 1
fi

# Run multi_batch_2.py with caffeinate to prevent sleep
# -i: Prevent idle sleep (keeps system awake while command runs)
echo "🚀 Running multi_batch_2.py with sleep prevention..."
echo "   💡 Your Mac will stay awake until the process completes"
echo "   📝 Check output/ directory for results"
echo ""
caffeinate -i python multi_batch_2.py "$@"

# Capture exit code
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    echo ""
    echo "============================================================"
    echo "✅ Processing completed successfully!"
    echo "============================================================"
    echo ""
    echo "📁 Output files:"
    echo "   - SPSS Scripts: output/SPSS_output_*.sps"
    echo "   - Batch Outputs: output/batch_outputs/"
    echo "   - Review Reports: output/review_reports/"
else
    echo ""
    echo "============================================================"
    echo "❌ Processing failed with exit code: $EXIT_CODE"
    echo "============================================================"
fi

exit $EXIT_CODE

