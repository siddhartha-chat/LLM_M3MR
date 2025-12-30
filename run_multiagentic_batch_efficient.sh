#!/bin/bash

# Run multiagentic_batch_efficient.py with sleep prevention
# This script activates the virtual environment and runs multiagentic_batch_efficient.py

echo "============================================================"
echo "Multi-Agent Batch Processor (multiagentic_batch_efficient.py)"
echo "Sleep Prevention: ENABLED"
echo "Processing Type: Sequential Batch Processing"
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

# Check if multiagentic_batch_efficient.py exists
if [ ! -f "multiagentic_batch_efficient.py" ]; then
    echo "❌ Error: multiagentic_batch_efficient.py not found in current directory"
    echo ""
    echo "Current directory: $(pwd)"
    echo "Please ensure the file is in the LLM_M3MR directory"
    exit 1
fi

# Run multiagentic_batch_efficient.py with comprehensive sleep prevention
# -i: Prevent idle sleep (keeps system awake)
# -d: Prevent display sleep
# -m: Prevent disk sleep
# -s: Prevent system sleep (when on AC power)
# Using nohup to continue even if terminal disconnects or system locks
LOG_FILE="multiagentic_batch_efficient_$(date +%Y%m%d_%H%M%S).log"

echo "🚀 Running multiagentic_batch_efficient.py with FULL sleep prevention..."
echo "   💡 Your Mac will stay awake even if locked or sleeping"
echo "   📝 Check output/ directory for results"
echo "   ⚙️  Processing: Sequential batches (one at a time)"
echo "   📄 Log file: $LOG_FILE"
echo "   ✅ Process will continue even if:"
echo "      - Terminal is closed"
echo "      - System is locked"
echo "      - Mac goes to sleep (if on AC power)"
echo ""
echo "   📊 Monitor progress: tail -f $LOG_FILE"
echo "   🛑 Stop process: pkill -f multiagentic_batch_efficient.py"
echo ""

# Run in background with nohup and comprehensive caffeinate flags
# -i: Prevent idle sleep
# -d: Prevent display sleep  
# -m: Prevent disk sleep
# -s: Prevent system sleep (AC power only)
# Using PYTHONUNBUFFERED to prevent output buffering
PYTHONUNBUFFERED=1 nohup caffeinate -i -d -m -s python -u multiagentic_batch_efficient.py "$@" > "$LOG_FILE" 2>&1 &
PID=$!

echo "✅ Process started in background (PID: $PID)"
echo "   Sleep prevention: FULL (idle, display, disk, system)"
echo "   Process will survive: terminal close, system lock, sleep"
echo ""
echo "   Monitoring initial output..."
echo ""

# Show initial output
sleep 3
if [ -f "$LOG_FILE" ]; then
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    tail -30 "$LOG_FILE"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "📊 Process is running! Monitor with: tail -f $LOG_FILE"
    echo ""
    echo "💡 You can now safely:"
    echo "   ✅ Close this terminal"
    echo "   ✅ Lock your Mac"
    echo "   ✅ Let it sleep (if on AC power)"
    echo "   ✅ Process will continue running in background"
    echo ""
    echo "📋 Useful commands:"
    echo "   Monitor: tail -f $LOG_FILE"
    echo "   Check status: ps aux | grep $PID"
    echo "   Stop process: pkill -f multiagentic_batch_efficient.py"
else
    echo "⚠️  Log file not created yet. Checking process status..."
    if ps -p $PID > /dev/null 2>&1; then
        echo "✅ Process is running (PID: $PID)"
        echo "   Log file will be created shortly: $LOG_FILE"
    else
        echo "❌ Process may have exited. Check for errors above."
    fi
fi

echo ""
echo "✅ Script setup complete. Process is running in background."
echo "   Check the log file for progress: $LOG_FILE"


