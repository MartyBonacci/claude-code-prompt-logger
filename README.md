# Claude Code Prompt Logger

Tools for exporting and analyzing your Claude Code session history to:
- Document successful workflows for sharing with others
- Identify prompt patterns that need refinement
- Improve your prompt communication skills over time

## Features

### 1. Session Exporter (Slash Command)
Export Claude Code sessions to clean, shareable markdown reports.

**Usage**: Within any Claude Code session, run:
```
/export-session
```

The command will ask what you want to export:
- A specific session by ID
- All sessions for the current project
- Sessions from a date range
- The current/most recent session

**Output**: A markdown file documenting:
- Your prompts (chronological, timestamped)
- Actions taken (files edited, commands run)
- Results and outcomes
- File changes/diffs

Perfect for showing others the exact steps you took in a successful workflow.

### 2. AI-Powered Prompt Analyzer (Slash Command)
Get intelligent, personalized insights into your prompting patterns.

**Usage**: Within any Claude Code session, run:
```
/analyze-prompts
```

The command will ask what you want to analyze:
- Current session only
- All sessions for the current project
- Specific session(s) by ID
- Sessions from a date range

**What it analyzes** (using AI):
- **Clarity & Specificity**: Was your goal clear? Were requirements explicit?
- **Context Provision**: Did you provide enough background information?
- **Correction Patterns**: Prompts that needed multiple clarifications
- **Success Patterns**: What makes your successful prompts work?
- **Tool Failures**: Commands/actions that failed and why

**Output**: Intelligent analysis report with:
- Overall metrics (first-try success rate, avg iterations)
- **Your actual prompts** with specific improvement suggestions
- Before/after examples showing better versions
- **Personalized patterns** based on YOUR communication style
- Custom prompt templates that work for you
- Progress tracking over time
- Actionable next steps

**Example insight**:
```
Your prompt: "Update the login function"
Issue: Required 3 clarifications (8 minutes)
Better: "Fix authentication bug in src/auth/login.js where
        passwords with special characters fail. Update regex
        to accept Unicode and add test case."
Impact: Would save ~2 hours across similar prompts
```

## Understanding Claude Code Sessions

Claude Code automatically records all interactions in session files located at:
```
~/.claude/projects/[encoded-project-path]/[session-id].jsonl
```

Each file contains a complete transcript of:
- Every prompt you wrote
- Every response from Claude
- All tool calls (file edits, bash commands, etc.)
- Tool results and outputs
- Timestamps and metadata

### Session Lifecycle
- Running `claude` creates a new session
- Running `claude -c` or `claude --continue` resumes the most recent session
- Each session has a unique UUID identifier
- Sessions persist across restarts (as long as you use `-c`)

## Installation

### Quick Install

```bash
git clone https://github.com/yourusername/claude-code-prompt-logger.git
cd claude-code-prompt-logger
./install.sh
```

That's it! The commands are now available in all your Claude Code sessions.

### Alternative: One-Line Install

```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/claude-code-prompt-logger/main/install.sh | bash
```

### Manual Installation

If you prefer to install manually:

1. Clone this repository
2. Copy the commands to your Claude directory:
   ```bash
   cp -r .claude/commands/* ~/.claude/commands/
   ```

### Uninstall

To remove the commands:

```bash
./uninstall.sh
```

## Quick Start

Once installed, use the commands in any Claude Code session:

1. **Export a workflow**:
   ```
   claude
   /export-session
   ```
   Follow the prompts to create a shareable report

2. **Analyze your prompting patterns**:
   ```
   /analyze-prompts
   ```
   Get AI-powered insights into how to improve

3. **Iterate**: Apply the recommendations and track your improvement over time

## Use Cases

- **Documentation**: Generate reports of successful workflows to share with colleagues
- **Learning**: Identify patterns in prompts that require multiple iterations
- **Quality**: Track your improvement over time (first-try success rate)
- **Proof of work**: Show stakeholders the exact steps taken in a project

## Requirements

- Claude Code CLI installed
- Access to `~/.claude/` directory (automatic with Claude Code)
- Bash (for installation scripts)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

Ideas for contributions:
- Additional analysis patterns
- Export format options (HTML, PDF, etc.)
- More detailed metrics
- Integration with other tools

## Troubleshooting

**Commands not showing up?**
- Run `/help` in Claude Code to verify installation
- Check that files are in `~/.claude/commands/`
- Restart your Claude Code session

**Installation failed?**
- Ensure you have write permissions to `~/.claude/`
- Try manual installation instead

**Need help?**
- Open an issue on GitHub
- Check existing issues for solutions

## License

MIT License - Copyright (c) 2025 Marty Bonacci
