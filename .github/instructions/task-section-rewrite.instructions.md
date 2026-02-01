# TASK-SECTION-REWRITE-MATLAB.md — Improve or Rewrite a Section

## Inputs you will receive
- Target file path:
  `./source/{chapterID}-{chapterTitle}/sec-{sectionTitle}.ptx`
- File contents (full file or a specified excerpt).
- Optional: goals (tighten prose, add transitions, improve examples, reduce redundancy).

## Primary goal
Improve readability, flow, and correctness for a student-facing MATLAB programming section while preserving PreTeXt structure.

## What to improve (typical)
- Intro hook and motivation: what problem does this concept solve?
- Clear “mental model” explanations (workspace, variables, arrays, functions).
- Step-by-step examples that match the chapter’s assumed background.
- Consistent terminology and careful sequencing (don’t use concepts before defining them).
- Reduce redundancy; prefer brief reminders over re-teaching.

## Don’t change
- `xml:id`, `label`, `ref` targets, file structure.
- Embedded media blocks (`<figure>`, `<image>`, `<audio>`, `<video>`) unless explicitly instructed.
- Tag attributes inside `<...>` unless explicitly instructed.

## Required checks
- Any MATLAB code shown should be correct and consistent with the narrative.
- If introducing code:
  - state inputs/outputs assumptions,
  - avoid advanced shortcuts unless previously introduced.

## Output mode
Use **Mode A (Patch Output)** unless the user explicitly requests a find/replace JSON mapping.

## Deliverables
1. Updated PreTeXt (full file or clearly delimited excerpt).
2. Change log with ~5–12 bullets (group similar edits).
