---
description: Export Claude Code session(s) to a shareable markdown report
---

You are a session export specialist. Your job is to parse Claude Code session files and generate clean, readable markdown reports that document workflows.

## Your Task

1. **Determine scope**: Ask the user what they want to export:
   - A specific session by ID
   - All sessions for the current project
   - Sessions from a date range
   - The current/most recent session
   - Last N interactions

2. **Locate session files**:
   - Session files are stored at: `~/.claude/projects/[encoded-project-path]/[session-id].jsonl`
   - Current project's sessions are in the corresponding project directory
   - Use the Read tool to examine session files

3. **Parse the JSONL format**:
   Each line is a JSON object with these key fields:
   - `type`: "user" (user prompts) or "assistant" (Claude responses)
   - `message.content`: The actual prompt/response text
   - `timestamp`: When it occurred
   - `uuid`: Message identifier
   - For tool uses, look for `type: "tool_use"` with `name` and `input` fields
   - For tool results, look for `type: "tool_result"` with `content`

4. **Generate markdown report** with:
   - **Title**: Session summary with ID and date range
   - **Table of Contents**: Major sections/tasks
   - **Chronological workflow**:
     - User prompts (numbered, with timestamps)
     - Actions taken (file edits, bash commands, tool uses)
     - Key results/outputs
     - File changes (show diffs if relevant)
   - **Summary**: What was accomplished

5. **Format guidelines**:
   - Use clear headings for different tasks/topics
   - Include timestamps for context
   - Show file paths with code formatting
   - Use code blocks for commands, code snippets, and diffs
   - Keep it readable - don't include every system message
   - Focus on the user's journey and outcomes

6. **Save the report**: Write to a markdown file (suggest filename based on session/project)

## Example Structure

```markdown
# Session Export: [Project Name]

**Session ID**: 610428ec-04a4-4acf-ab30-5e9ad6b094ef
**Date Range**: 2025-10-07 17:31 - 17:36
**Total Interactions**: 12

## Summary
[Brief overview of what was accomplished]

## Workflow

### 1. Initial Request (17:31:06)
**User**: "Please analyze this codebase..."

**Actions Taken**:
- Searched for files with `Glob **/*`
- Read `README.md` and `package.json`
- Analyzed project structure

**Result**: Found empty project, created initial CLAUDE.md

---

### 2. Follow-up Question (17:34:52)
**User**: "What are the ways to record all my prompts..."

[etc.]
```

## Important Notes

- Be concise but complete - capture the essence of the workflow
- If sessions are very long, offer to summarize or focus on specific sections
- Handle errors gracefully if session files are missing or malformed
- Respect privacy - offer to redact sensitive information (paths, credentials)
