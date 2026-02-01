# TASK-READING-CHECKPOINTS-MATLAB.md — Create Reading Checkpoint Questions for a Section

## Inputs you will receive
- Target section file:
  `./source/{chapterID}-{chapterTitle}/sec-{sectionTitle}.ptx`
- Section content (full text or excerpt).
- Optional: where checkpoints should appear (mid-narrative, end-of-subsection, etc.).

## Primary goal
Write **10 reading checkpoint questions** that test understanding of this MATLAB programming section.

## Question design requirements
- Produce **10 questions**.
- **No short-answer** questions.
- Mix formats:
  - multiple choice
  - multiple select
  - true/false
  - matching / card-sort (if supported by your PreTeXt/Runestone pipeline)
- Each question must have a **short, descriptive title** (not a restatement of the prompt).
- Feedback must **teach**:
  - Avoid “Correct!” / “Nope” style feedback.
  - Explain the concept that makes the right choice right.

## Content alignment (MATLAB-specific)
- Questions should target the section’s actual skills:
  - interpreting code output
  - indexing and slicing
  - array shapes
  - elementwise vs matrix ops
  - loop logic / conditional logic (as appropriate)
  - function vs script distinctions
- Prefer short code snippets and conceptual checks; avoid long debugging marathons.

## PreTeXt formatting expectations
- Use the assessment structure established by the project.
- All code snippets use the project’s code markup (often `<program language="matlab">`).
- Do not wrap the full statement in `<em>`.

## Output mode
Default to **Mode A (Patch Output)**: a ready-to-paste PreTeXt block of 10 questions, plus brief placement suggestions.

## Deliverables
1. PreTeXt block with 10 questions + feedback.
2. Placement suggestion list (where they fit best and why).
