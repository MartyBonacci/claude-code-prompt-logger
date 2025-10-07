# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Claude Code Prompt Logger - Tools for exporting and analyzing Claude Code session data to improve prompt communication skills and document successful workflows.

## Architecture

This project provides two complementary tools:

### 1. Session Exporter (Slash Command)
- **Location**: `.claude/commands/export-session.md`
- **Usage**: `/export-session` within any Claude Code session
- **Purpose**: Generate shareable markdown reports documenting workflows
- **Output**: Human-readable markdown files showing prompts, actions, and results

### 2. AI-Powered Prompt Analyzer (Slash Command)
- **Location**: `.claude/commands/analyze-prompts.md`
- **Usage**: `/analyze-prompts` within any Claude Code session
- **Purpose**: Provide intelligent analysis of prompting patterns with personalized recommendations
- **Features**:
  - AI-powered semantic analysis of prompts
  - Identifies clarity, specificity, and context issues
  - Detects correction/clarification chains
  - Calculates success metrics
  - Generates personalized improvement suggestions with before/after examples
  - Creates custom prompt templates based on user's successful patterns
  - Tracks progress over time

## Session File Format

Claude Code stores all interactions in JSONL files at:
```
~/.claude/projects/[encoded-project-path]/[session-id].jsonl
```

Each line is a JSON object containing:
- User prompts and assistant responses
- Tool calls and results
- File change snapshots
- Timestamps and metadata

## Commands

### Export a Session
Use the slash command within Claude Code:
```
/export-session
```

### Analyze Prompts
Use the slash command within Claude Code:
```
/analyze-prompts
```

The command will interactively ask what scope to analyze (current session, all project sessions, date range, etc.) and generate an AI-powered analysis report with personalized recommendations.

## License

MIT License - Copyright (c) 2025 Marty Bonacci
