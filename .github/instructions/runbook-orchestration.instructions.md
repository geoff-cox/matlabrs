# RUNBOOK-ORCHESTRATION-MATLAB.md — How to Use These Task Files

## Recommended workflow
1. Choose the matching task file:
   - Section rewrite → TASK-SECTION-REWRITE-MATLAB.md
   - Reading checkpoints → TASK-READING-CHECKPOINTS-MATLAB.md
   - Exercises → TASK-EXERCISES-MATLAB.md
   - TTS narration → TASK-TTS-NARRATION-MATLAB.md
2. Prepend AGENT-CORE-MATLAB.md to the agent prompt.
3. Provide:
   - Target file path,
   - Full file content (preferred) or a clearly marked excerpt,
   - Constraints (tone, length, insertion points, difficulty, etc.).
4. Require the output mode specified by the task file.

## When to require Find/Replace JSON (Mode B)
Use when you want safe, automated application of repeated edits (consistent phrasing or standardization).

## When to require Patch Output (Mode A)
Use when the agent is writing new content or context-dependent edits (new explanations, new exercises, new questions).

## Minimal prompt template
- `TASK: ...`
- `TARGET: ...`
- `OUTPUT MODE: A or B`
- `CONTENT: ...`
- `CONSTRAINTS: ...`
