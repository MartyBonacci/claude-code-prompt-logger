#!/usr/bin/env bash

# Claude Code Prompt Logger - Installation Script
# Installs slash commands to user's Claude Code directory

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Claude Code Prompt Logger Installer  ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Determine user's Claude commands directory
CLAUDE_COMMANDS_DIR="${HOME}/.claude/commands"

echo -e "${BLUE}→${NC} Installation directory: ${CLAUDE_COMMANDS_DIR}"
echo ""

# Create directory if it doesn't exist
if [ ! -d "${CLAUDE_COMMANDS_DIR}" ]; then
    echo -e "${YELLOW}→${NC} Creating Claude commands directory..."
    mkdir -p "${CLAUDE_COMMANDS_DIR}"
fi

# Get the script's directory (where install.sh is located)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOURCE_DIR="${SCRIPT_DIR}/.claude/commands"

# Check if source commands exist
if [ ! -d "${SOURCE_DIR}" ]; then
    echo -e "${RED}✗${NC} Error: Could not find commands directory at ${SOURCE_DIR}"
    echo -e "${RED}✗${NC} Make sure you're running this script from the repository root."
    exit 1
fi

# Install commands
echo -e "${BLUE}→${NC} Installing commands..."
echo ""

INSTALLED_COUNT=0

for cmd_file in "${SOURCE_DIR}"/*.md; do
    if [ -f "${cmd_file}" ]; then
        cmd_name=$(basename "${cmd_file}")
        cmd_display_name="${cmd_name%.md}"

        # Copy command file
        cp "${cmd_file}" "${CLAUDE_COMMANDS_DIR}/${cmd_name}"

        echo -e "${GREEN}✓${NC} Installed: /${cmd_display_name}"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi
done

echo ""

if [ ${INSTALLED_COUNT} -eq 0 ]; then
    echo -e "${RED}✗${NC} No commands were installed."
    exit 1
fi

# Success message
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║     Installation Complete! ✓           ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}${INSTALLED_COUNT}${NC} command(s) installed successfully."
echo ""
echo -e "${BLUE}Available commands:${NC}"
echo -e "  ${GREEN}/export-session${NC}  - Export sessions to markdown reports"
echo -e "  ${GREEN}/analyze-prompts${NC} - AI-powered prompt analysis"
echo ""
echo -e "${BLUE}Usage:${NC}"
echo -e "  1. Start a Claude Code session: ${YELLOW}claude${NC}"
echo -e "  2. Use the commands: ${YELLOW}/export-session${NC} or ${YELLOW}/analyze-prompts${NC}"
echo ""
echo -e "${BLUE}Tip:${NC} Type ${YELLOW}/help${NC} in any Claude session to see all available commands."
echo ""
echo -e "Happy prompting! 🚀"
echo ""
