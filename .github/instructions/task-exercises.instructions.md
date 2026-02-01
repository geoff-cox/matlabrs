# TASK-EXERCISES-MATLAB.md — Improve/Add/Write Exercises + Solutions

## Inputs you will receive
- Target exercises file:
  `./source/{chapterID}-{chapterTitle}/exercises-{sectionTitle}.ptx`
- Existing exercise set (full file or excerpt).
- Optional: desired difficulty distribution and topics.

## Primary goal
Create a coherent, beginner-friendly set of MATLAB exercises aligned to the section’s learning goals, with solutions if requested.

## Exercise design requirements
- Maintain a spread:
  - warm-up / routine
  - conceptual checks (predict output, identify error, choose best code)
  - medium synthesis (combine 2–3 ideas)
  - a small number of challenge problems (carefully scaffolded)
- Avoid repetitive clones unless explicitly desired.
- Prefer exercises that teach one clear point.

## Solutions (if requested)
- Show key steps and reasoning, not just final code.
- Keep solutions readable:
  - explain *why* a line is needed (esp. for indexing/shape issues)
- Ensure code is correct and consistent with the chapter’s introduced features.

## Don’t change
- Existing ids/labels unless explicitly instructed.
- File’s structural containers (exercise groups/divisions).

## Output mode
- Localized improvements: **Mode A (Patch Output)**.
- Bulk consistent phrasing changes: **Mode B (Find/Replace JSON)** if requested.

## Deliverables
1. Updated exercise block(s).
2. Change log (new exercises, modified exercises, solutions added).
