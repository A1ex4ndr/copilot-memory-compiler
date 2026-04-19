#!/bin/bash
# session-end.sh
# Extracts knowledge from the current session and appends to today's daily log.
# This script is triggered by the sessionEnd hook.

MEMORY_DIR="${WORKSPACE_DIR:-$(pwd)}/memory"
DAILY_DIR="$MEMORY_DIR/daily"
TODAY=$(date -u +"%Y-%m-%d")
TIME=$(date -u +"%H:%M")
DAILY_FILE="$DAILY_DIR/$TODAY.md"

# Ensure directories exist
mkdir -p "$DAILY_DIR"

# If the daily file doesn't exist, create it with a header
if [ ! -f "$DAILY_FILE" ]; then
    cat > "$DAILY_FILE" << EOF
# Daily Log: $TODAY

EOF
fi

# Append a session marker
cat >> "$DAILY_FILE" << EOF

## [$TIME] Session Ended

> Session knowledge extraction pending. Run the **flush** skill or the memory-compiler agent to extract knowledge from this session.

---
EOF

echo "Session marker appended to $DAILY_FILE"
echo "Run 'flush' skill with the memory-compiler agent to extract detailed knowledge."

# Auto-compile if there are unprocessed logs and it's after 18:00 UTC
HOUR=$(date -u +"%H")
if [ "$HOUR" -ge 18 ]; then
    UNPROCESSED=$(grep -rL "<!-- compiled -->" "$DAILY_DIR"/*.md 2>/dev/null | wc -l)
    if [ "$UNPROCESSED" -gt 0 ]; then
        echo ""
        echo "⏰ End of day detected with $UNPROCESSED unprocessed log(s)."
        echo "Consider running the **compile** skill to organize today's knowledge."
    fi
fi
