#!/usr/bin/env bash

# Claude Code Prompt Logger - Uninstallation Script
# Removes slash commands from user's Claude Code directory

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║ Claude Code Prompt Logger Uninstaller ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Determine user's Claude commands directory
CLAUDE_COMMANDS_DIR="${HOME}/.claude/commands"

echo -e "${BLUE}→${NC} Commands directory: ${CLAUDE_COMMANDS_DIR}"
echo ""

# Check if directory exists
if [ ! -d "${CLAUDE_COMMANDS_DIR}" ]; then
    echo -e "${YELLOW}⚠${NC} No Claude commands directory found."
    echo -e "${YELLOW}⚠${NC} Nothing to uninstall."
    exit 0
fi

# List of commands to remove
COMMANDS=(
    "export-session.md"
    "analyze-prompts.md"
)

REMOVED_COUNT=0

echo -e "${BLUE}→${NC} Removing commands..."
echo ""

for cmd_file in "${COMMANDS[@]}"; do
    cmd_path="${CLAUDE_COMMANDS_DIR}/${cmd_file}"
    cmd_display_name="${cmd_file%.md}"

    if [ -f "${cmd_path}" ]; then
        rm "${cmd_path}"
        echo -e "${GREEN}✓${NC} Removed: /${cmd_display_name}"
        REMOVED_COUNT=$((REMOVED_COUNT + 1))
    else
        echo -e "${YELLOW}⊘${NC} Not found: /${cmd_display_name}"
    fi
done

echo ""

if [ ${REMOVED_COUNT} -eq 0 ]; then
    echo -e "${YELLOW}⚠${NC} No commands were removed (they may not have been installed)."
    exit 0
fi

# Success message
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║    Uninstallation Complete! ✓          ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}${REMOVED_COUNT}${NC} command(s) removed successfully."
echo ""
echo -e "${BLUE}Commands removed:${NC}"
echo -e "  ${RED}/export-session${NC}"
echo -e "  ${RED}/analyze-prompts${NC}"
echo ""
echo -e "Thank you for using Claude Code Prompt Logger!"
echo ""
