# Drafting — Voice, Structure, and Pedagogy

**How to write content for this textbook.** Pair with `project-core.instructions.md` for every drafting task.

---

## Drafting Workflow

1. **Ask design questions first.** Surface non-obvious scoping decisions (what's in, what's out, what's deferred) before writing a section plan.
2. **Propose a section breakdown.** Lay out every section and its planned subsections. Flag 3–6 specific questions with recommendations.
3. **Draft one subsection at a time.** Wait for approval before moving to the next. Flag 2–4 judgment calls after each subsection.
4. **Ship exercises in blocks.** One block per section, delivered in halves if large (>8 tasks).
5. **Pause for re-plans when assumptions shift.** If a late decision changes earlier content, stop, propose follow-on edits, and get approval before resuming.
6. **Read the latest drafts** before writing new content, especially before starting a new chapter.

---

## Subsection Shape

A healthy subsection follows this skeleton:

1. One opening paragraph motivating the new idea — lean, no preamble. Start with the problem the tool solves ("Suppose you want to..."), not an abstraction ("In this subsection we will explore...").
2. A first concrete example, usually in a `<sage>` cell.
3. Brief explanation of what happened.
4. Additional examples in `Command ⤵︎ / Result ⤵︎` `<sidebyside>` panels.
5. Optionally, one `<aside>` for a sharp-edge warning, cross-language note, or MATLAB quirk.
6. Optionally, a summary `<table>` when the subsection introduced multiple distinct techniques.

### What to avoid

- **Recaps at subsection-end.** Don't summarize what you just said.
- **Transitions between subsections.** Don't write handoff paragraphs. Each subsection should open cleanly on its own.
- **Cross-language comparisons in running prose.** Move to `<aside>`, keep to one or two per chapter max. The transferable-skills philosophy drives topic selection and structure — it doesn't need to be announced.
- **Over-engineering section titles.** Broad titles are fine when a section covers broad ground.

---

## Section Architecture

Each `<section>` follows this subsection order:

| Order | Subsection | `xml:id` pattern |
|-------|-----------|-----------------|
| 1 | 🧱 Structure | `subsec-TOPIC-structure` |
| 2 | 👀 Examples | `subsec-TOPIC-examples` |
| 3 | 🧑🏻‍💻 Practice Activities | `subsec-TOPIC-practice-activities` |
| 4 | 📖 Reading Questions | `TOPIC-reading-questions` |
| 5 | 💻 Coding Exercises | `TOPIC-coding-exercises` |

### Structure subsection
- Opens with an `<assemblage>` box: syntax template, key rules as `<ul marker="square">`, and terminology marked with `<term>`.
- Followed by 2–5 inline `<exercise>` tasks (MC or T/F) as reading checkpoints.
- Comparison tables go here if the section introduces a comparison.

### Examples subsection
- Use `<example>` tags with `<title>` and `<statement>`.
- Show side-by-side code with `<sidebyside widths="48% 48%">` and `<stack>` children.
- For accumulation/trace examples, show both the loop version and the expanded written-out version.

### Practice Activities subsection
- **Solution visibility**: `component="example-solution"` (visible by default).
- **Scaffolding progression**: Trace/Expand → Convert/Rewrite → Write from scratch → Parsons problems → Multi-step activities → Function-writing.
- Use `<sage language="octave">` cells with `%─── TYPE YOUR CODE HERE ───%` markers.
- Include expected output for self-checking.

### Reading Questions
- Wrap in `<reading-questions>`, not `<subsection>`.
- Target 10–15 questions per section.
- Mix: ~60% multiple choice (4 choices each), ~25% true/false, ~15% fill-in.
- Every MC choice needs `<feedback>` that teaches — never just "Correct!" or "Nope."
- Distractors must target plausible student misconceptions.
- Cover: syntax recall, when-to-use decisions, tracing/output prediction, bug identification.

### Coding Exercises
- Wrap in `<exercises>`, not `<subsection>`.
- **Solution visibility**: bare `<solution>` (hidden by default). NOT `component="exercise-solution"`.
- Group related problems under a shared `<exercise>` with `<task>` children.
- Steady difficulty progression. Block 1 achievable by all; Block 2 challenges strong students.

---

## Exercise Design Principles

- **Independence.** Each task stands alone. Never chain tasks.
- **Small test cases.** Values that fit in a sidebyside panel and can be verified by hand.
- **Corner cases.** Empty vectors, single-element, ties, zero, negative. Include at least one per exercise.
- **Explicit tool prohibitions.** "Do not use a loop." "Do not use the built-in `sum`." Students take shortcuts that defeat the exercise otherwise.
- **Pair exercises for contrast.** E.g., vectorized version and loop version side-by-side.
- **Acknowledge built-ins.** When reimplementing (`mySum`, `myMax`), briefly note the built-in exists and explain why writing their own builds understanding.

### Exercise format

Each `<task>` contains:
1. A problem statement starting with "Write a function..." (function names appear with empty parens: `<pf>myFunc()</pf>`)
2. An I/O specification `<tabular>` — columns for Inputs/Outputs, variable name, dimension annotation (e.g., `(1xn) double`), description
3. A `<sidebyside>` test-cases panel: `Test Cases ⤵︎` and `Expected ⤵︎` (widths typically `60% 38%` or `49% 49%`)
4. A `<solution component="exercise-solution">` with minimal, clean code and a brief explanatory sentence only when warranted

### Sentinel conventions

- "Not found" in searches: return `-1` for index-based answers or `[]` for matching MATLAB convention. Be consistent within a chapter.
- Logical results: explicit `true`/`false` in expected output.

### Editorial annotations

`⭐` marks upcoming homework assignments; `👩🏻‍💻` marks in-class walkthroughs. These are author-facing editorial annotations — not student-facing difficulty indicators. The author adds these; do not insert them in drafts.

---

## Pedagogical Conventions

- **Positions vs. values.** Always clarify that an index is a *position*, not a value. Reinforce every time a new indexing form is introduced.
- **Preallocation.** Whenever a loop builds a result, preallocate with `zeros`. Mention the cost-of-growing informally the first time, then reference on return visits.
- **`end` keyword.** Introduce with first vector indexing. Emphasize `end` arithmetic (`v(end-1)`). Reiterate for matrices.
- **Vectorization vs. loops.** State "prefer the most vectorized form that works" once per chapter, then let examples do the work.
- **Cognitive load discipline.** Actively defer or remove content that introduces concepts before students are ready.

---

## Judgment-Call Protocol

At the end of each subsection draft, flag 2–4 judgment calls. Good ones to surface:

- Tradeoffs in example choice (realistic vs. minimal)
- Placement decisions (main flow vs. aside vs. exercise)
- Framing choices (strict rule vs. guideline)
- Optional content (summary table? error example? cross-language note?)
- Deferred content (own subsection or merged into another?)

Pick the calls most likely to affect the author's opinion. Don't flag every micro-decision.

---

## What Gets Edited (Pre-Correct for These)

- Over-long transitions get cut.
- Cross-language comparisons in running prose get cut — move to asides.
- Recaps at subsection-end get cut.
- Announced "aha moments" get cut.
- Concrete illustrations (tabulars, math notation) get added — build them yourself rather than writing "imagine a vector like this..."
- Section titles get simplified or combined.

---

## Creativity and Enhancements

Propose creative and novel approaches when they'd help:

- Custom illustrations (positions-vs-values tabulars, arrow diagrams, side-by-side comparisons)
- Structural alternatives (subsection reordering with pedagogical justification)
- Exercise variants beyond the minimum
- Research-backed variations (spaced retrieval, worked-example fading, interleaving) tied to a specific subsection

Always surface tradeoffs. Don't quietly restructure — propose and let the author decide.
