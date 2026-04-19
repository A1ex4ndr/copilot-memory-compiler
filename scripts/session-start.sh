#!/bin/bash
# session-start.sh
# Injects the knowledge base index into the session context.
# This script is triggered by the sessionStart hook.

MEMORY_DIR="${WORKSPACE_DIR:-$(pwd)}/memory"
INDEX_FILE="$MEMORY_DIR/index.md"

if [ -f "$INDEX_FILE" ]; then
    echo "## Knowledge Base Context"
    echo ""
    echo "The following index summarizes your personal knowledge base from previous sessions:"
    echo ""
    cat "$INDEX_FILE"
    echo ""
    echo "---"
    echo "Use the **query** skill to search for specific knowledge, or the **compile** skill to process new daily logs."
else
    echo "## Knowledge Base"
    echo ""
    echo "No knowledge base found yet. Knowledge will be captured automatically as you work."
    echo "After your first session, use the **compile** skill to organize captured knowledge."
fi
