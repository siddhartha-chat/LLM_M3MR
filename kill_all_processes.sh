#!/bin/bash

# Kill all processes related to LLM_M3MR scripts

echo "🔍 Searching for related processes..."

# Find all related processes
PROCESSES=$(ps aux | grep -E "multiagentic_batch_efficient|multi_batch_2|multi_batch_1|main\.py.*LLM_M3MR" | grep -v grep)

if [ -z "$PROCESSES" ]; then
    echo "✅ No related processes found"
    exit 0
fi

echo "Found processes:"
echo "$PROCESSES"
echo ""

# Kill processes
echo "🛑 Killing processes..."

pkill -f "multiagentic_batch_efficient.py" 2>/dev/null && echo "✅ Killed multiagentic_batch_efficient.py"
pkill -f "multi_batch_2.py" 2>/dev/null && echo "✅ Killed multi_batch_2.py"
pkill -f "multi_batch_1.py" 2>/dev/null && echo "✅ Killed multi_batch_1.py"
pkill -f "caffeinate.*python.*multiagentic" 2>/dev/null && echo "✅ Killed caffeinate processes"

# Wait a moment
sleep 1

# Verify
REMAINING=$(ps aux | grep -E "multiagentic_batch_efficient|multi_batch_2|multi_batch_1" | grep -v grep)
if [ -z "$REMAINING" ]; then
    echo ""
    echo "✅ All processes killed successfully"
else
    echo ""
    echo "⚠️  Some processes may still be running:"
    echo "$REMAINING"
    echo ""
    echo "To force kill, use:"
    echo "  pkill -9 -f 'multiagentic_batch_efficient.py'"
fi

