# Agent Skill: Drafting Chapters for Geoff's MATLAB Textbook

This document captures the workflow, voice, and pedagogical conventions established while drafting the Vectors and Matrices chapters of Geoff's introductory MATLAB textbook. Use it as the playbook for future chapters.

---

## 1. Goal and audience

The book teaches **general programming skills** using MATLAB as the vehicle. Students are beginners. The running premise is that moving between high-level languages is primarily a matter of syntax, so the book emphasizes transferable concepts: collections, indexing, iteration, reduction, conditional flow, etc.

However — **this is an implicit philosophy, not a recurring drumbeat in the prose**. Do not pepper sections with "other languages call this..." or "this is how Python handles it...". Cross-language comparisons should appear at most once or twice per chapter, usually in an `<aside>`, and only when they genuinely help a student calibrate expectations. The transferable-skills framing drives *what topics are covered and how they are structured*; it does not need to be announced.

---

## 2. Workflow: how to draft a chapter

Use this loop:

1. **Ask design questions before drafting.** At the start of each chapter, surface the non-obvious scoping decisions (what's in, what's out, what's deferred) and get Geoff's answers before writing a section plan. Good examples of these questions from past chapters: Does logical indexing go here or its own chapter? How much linear algebra? Nested loops as a section or subsection? Reshape in the body or as an exercise?

2. **Propose a section breakdown.** Once scoping is settled, lay out every section and its planned subsections, with a brief note on what each covers. Flag 3–6 specific questions you'd like Geoff's input on before drafting: content inclusions, ordering, naming, forward-references, etc. Make recommendations, but frame them as recommendations.

3. **Draft one subsection at a time, waiting for approval.** Never jump ahead. After each subsection, flag 2–4 judgment calls you made so Geoff can react.

4. **Ship exercises in blocks matching the section structure.** One `<exercise>` block per section, delivered in halves if a block is large (>8 tasks).

5. **Pause for re-plans when design assumptions shift.** If a late decision changes earlier content (e.g., "let's formally include aggregate functions in the vectors chapter"), stop, propose the follow-on edits to already-approved content, and only resume the current chapter once the earlier fix is complete.

6. **Expect edits.** Geoff will restructure, trim, add illustrative tabulars, and sometimes rename functions or merge/split subsections. Read the latest drafts before writing new content — especially before starting a new chapter.

---

## 3. Voice and tone

- **Plain prose. Short sentences. Unfussy.** Think of a patient, experienced instructor speaking directly to a beginner.
- **Em-dashes sparingly.** Geoff often replaces `—` with a period or comma. Default to commas and periods; reserve em-dashes for a genuine parenthetical aside mid-sentence.
- **No hype words.** Avoid "powerful," "elegant," "beautiful," "finally," "at last," "the magic of," "transformative," "dramatically," "enormous." If the idea is useful, the example will show it.
- **No meta-commentary about pedagogy.** Don't tell students "this is the aha moment" or "this is the payoff of the section." Show the useful thing and move on.
- **No announced callbacks.** Don't write "as you'll recall from Chapter 3..." — just use the tool; students who remember will feel at home, students who don't will re-learn in context.
- **Avoid `@q{}` / `<q>` for emphasis.** Use `<em>` or `<term>` for genuine terminology. Reserve `<q>` for real quoted phrases like a concept name in air-quotes.
- **"You" is the default.** Second person throughout. First-person plural ("we will...") is used sparingly for "we'll come back to this" forward-references.

---

## 4. Structural patterns

### Subsection shape

A healthy subsection has roughly:

1. One opening paragraph motivating the new idea — lean, no preamble.
2. A first concrete example, usually in a `<sage>` cell so students can run it.
3. A brief explanation of what happened.
4. Additional examples in a `Command ⤵︎ / Result ⤵︎` `<sidebyside>` for a broader pattern.
5. One supporting `<aside>` if a sharp-edge warning, cross-language note, or MATLAB-specific quirk fits naturally.
6. Optionally, a summary `<table>` when the subsection introduced multiple distinct techniques (not for "here's one concept with many examples").

### Openers

Start with the problem the new tool solves, not with abstractions. The first sentence should be concrete. Avoid: "In this subsection we will explore..." Prefer: "Suppose you want to...". Do not recap what the student did in the previous subsection.

### Closers

Don't end every subsection with a recap or a forward-reference to the next one. Most subsections should just end once the content is done. Forward-references are appropriate only when a concept is deliberately deferred (e.g., "we'll come back to transpose in the matrices chapter").

### Asides: use sparingly and for specific jobs

`<aside>` blocks work best for:
- **Sharp-edge warnings** students will actually hit (e.g., `zeros(6)` doesn't do what you think).
- **MATLAB-specific quirks** that are worth naming but aren't part of the main flow (e.g., row/column distinction, one-based indexing).
- **Rationales** that a curious student would want but an average student can skip (e.g., why `.*` needs the dot).

Do not use asides for:
- Cross-language comparisons in every subsection (at most once or twice per chapter).
- Restating what was just said.
- Pedagogical meta-commentary ("this is the payoff...").

### Forward- and backward-references

- **Backward:** A light callback is fine ("you already used `sqrt` on scalars; it also works on vectors"). Avoid formal cross-references with chapter numbers — students are reading linearly.
- **Forward:** Only for genuine deferrals ("we'll revisit this when we get to matrices"). Keep these short.

---

## 5. Illustrations and visual formatting

This is a place where Geoff's hand is strongest. He frequently adds custom visual illustrations I wouldn't have thought to include. Lean in this direction.

### Patterns that have worked well

- **`Command ⤵︎ / Result ⤵︎` `<sidebyside>`** for showing multiple examples with their outputs. Standard widths `38% 58%` or `48% 48%`.
- **Concept-illustration tabulars.** For "positions vs. values," a two-row tabular with position indices on top and values on the bottom. For element-wise operations, a tabular with the two vectors stacked and the operation producing an output vector (Geoff has used these with arrows and `→` symbols).
- **Math notation for data layouts.** Geoff has illustrated "seven separate variables vs. one vector variable" using inline math: listing `temp1 = 68`, `temp2 = 71`... in one column and a column-vector bracket `[68; 71; 75; ...]` in another. When a visual comparison helps, reach for this.
- **Explicit error examples.** Show invalid commands side-by-side with the MATLAB error messages they produce. This teaches students to recognize error messages when they see them.
- **Three-panel `<sidebyside>`** for parallel examples (e.g., row vector / row vector with spaces / column vector).
- **Summary tables** with `<col halign=... width=...>` specifications for consistent widths.

### Formatting rules

- Code inside `<program>` and `<sage>` uses tabs for indentation. Keep the examples short.
- `<pf>` for inline code and function names (`<pf>sum(v)</pf>`). Not `<c>`.
- `<term>` for first uses of defined terminology. `<em>` for ordinary emphasis.
- `<m>` for inline math, `<me>` for display math. Use `\cdot`, `\sqrt{}`, etc. — no unicode math symbols in `<m>`.
- `<sage language="octave">` for runnable interactive cells (avoids Sage's licensing requirements).
- `<program language="matlab">` for static code listings.
- Never use `clc` or `pause` inside Sage cells — they break browser-based execution.

---

## 6. Exercises

### File structure

One `<exercises xml:id="...-coding-exercises">` root element. Inside it, one `<exercise>` block per section of the chapter, titled to match. Each block contains `<task>` elements with:

- **A problem statement** beginning with "Write a function...". Function names appear with empty parens: `<pf>firstAndLast()</pf>`. Do not add emoji markers at the start of statements — `⭐` and `👩🏻‍💻` in existing exercise files are Geoff's temporary, author-facing editorial annotations (for upcoming homework problems and in-class walkthroughs, respectively) and he adds them himself as part of assignment planning.
- **An input/output specification tabular** with columns for `Inputs:` / `Outputs:`, variable name, dimension annotation (e.g., `(1xn) double`, `(1x1) double`, `(1x1) logical`), and a short description. Use `<col>` width specifications and minor borders.
- **A `<sidebyside>` test-cases panel** showing `Test Cases ⤵︎` and `Expected ⤵︎`. Widths are typically `60% 38%` or `49% 49%`.
- **A `<solution component="exercise-solution">`** with "Here is one possible solution:" and a minimal `<program>`. Include a brief explanatory sentence in the solution only when the technique is genuinely worth one (e.g., pointing out why the strict `>` inequality matters for tie-breaking).

### Exercise design principles

- **Independence.** Each task stands alone. Do not chain tasks across the file.
- **Small test cases.** Use values that fit comfortably in the sidebyside. A 10x10 matrix as a test case doesn't help a student verify by hand.
- **Corner cases matter.** Empty vectors, single-element vectors, ties, zero, negative numbers. Include at least one in most exercises.
- **Explicit tool prohibitions when needed.** "Do not use a loop." "Do not use the built-in `sum`." "Use `return` to stop as soon as you find a match." Students otherwise take shortcuts that defeat the exercise's purpose.
- **Pair exercises where contrast teaches.** E.g., an `elementwiseProduct` (vectorized, Block 2) and `elementwiseProductLoop` (nested loop, Block 3) side-by-side drive home when to vectorize.
- **Expand drills for Block 1.** Geoff's exercise blocks run longer than the initial plans I've proposed. Expect the first block of each section to have more drill-style variations than I'd draft by default. When in doubt, propose a plan of ~8 tasks per block and let Geoff signal if he wants more.

### Sentinel conventions

- "Not found" in searches: return `-1` for index-based answers (`firstAbove`) or `[]` for matching MATLAB's native convention (`firstIndexOf`). Geoff has used both — match whatever past exercises in the same chapter use.
- Logical results: explicit `true`/`false` in expected output.

---

## 7. Pedagogical conventions specific to this book

- **Positions vs. values.** Always clarify that an index is a *position*, not a value. This bug is the single most common source of confusion with indexing, and every chapter that introduces a new indexing form should reinforce it.
- **Preallocation.** Whenever a loop builds a result collection, preallocate with `zeros`. The cost-of-growing explanation is worth including (informally) the first time in each chapter, then referenced on return visits.
- **`end` keyword.** Introduce the first time vector indexing appears. Emphasize arithmetic on `end` (`v(end-1)`) because it's such a common idiom. Reiterate for matrices (it works in each index slot).
- **Built-ins vs. reimplemented.** When an exercise asks students to reimplement a built-in (`mySum`, `myMax`), the problem statement should briefly acknowledge the built-in exists and explain that writing their own builds understanding. Never pretend a built-in doesn't exist.
- **Vectorization vs. loops.** The "prefer the most vectorized form that works" rule is the running spine of the middle chapters. State it once per chapter, then let the examples do the work.

---

## 8. Judgment-call protocol

At the end of each subsection draft, flag 2–4 judgment calls so Geoff can quickly accept or redirect. Good judgment calls to surface:

- Tradeoffs in example choice (realistic vs. minimal, contrived vs. long).
- Placement decisions (in the main flow, in an aside, in an exercise).
- Framing choices (strict rule vs. guideline; prescriptive vs. descriptive).
- Optional content (include a summary table? include an error example? include a cross-language note?).
- Deferred content (should X be its own subsection or merged into Y?).

Pick the ones most likely to affect Geoff's opinion. Don't flag every micro-decision.

---

## 9. What Geoff tends to edit

Use these signals to pre-correct your drafts:

- **Over-long transitions get cut.** If a paragraph's main job is to connect one subsection to the next, it usually gets trimmed or removed. Write subsections that open cleanly without needing a handoff from the previous one.
- **Cross-language comparisons in running prose get cut.** Move these into asides, keep at most one or two per chapter, and keep them short.
- **Section titles get simplified or combined.** "Creating, Indexing & Modifying Vectors" was Geoff's merger of multiple titles. Don't over-engineer the section title — it can be broad if the section covers broad ground.
- **Concrete illustrations get added.** When a concept can be shown with a custom tabular or math notation, Geoff often adds one. If you find yourself writing "imagine a vector like this..." consider building the illustration yourself instead.
- **Recaps at subsection-end get cut.** Don't summarize what you just said.
- **Announced "aha moments" get cut.** Don't narrate that something is the payoff.

---

## 10. Creativity and enhancements

Geoff explicitly welcomes creative and novel approaches and pedagogically supported enhancements. Concrete ways to exercise this:

- **Propose custom illustrations** when they'd help. A positions-vs-values tabular. A side-by-side of "7 scalars vs. 1 vector." An arrow-diagram showing element-wise multiplication. Build them into the draft rather than just suggesting them.
- **Propose structural alternatives** when they'd land better than the plan. Swapping subsection order (as happened for the matrix loops section) is fair game if you can articulate the pedagogical argument.
- **Propose exercise variants** beyond the minimum. "Here's the basic version; would you like a pair of harder variations?"
- **Research-backed variations** (spaced retrieval, worked-example fading, interleaving) are welcome when proposed explicitly and tied to a specific subsection — not as broad program changes.
- **Always surface tradeoffs.** If your creative suggestion trades one thing for another, name what's being traded. Don't quietly restructure; propose and let Geoff decide.

---

## 11. File and naming conventions

- Chapter wrapper: `chp-<slug>.txt`, with `xml:id="chp-<slug>"`.
- Section files: `sec-<slug>.ptx` referenced by `<xi:include>` from the chapter wrapper.
- Exercise files: `exercises-<slug>.ptx`.
- Section IDs: `sec-<slug>`.
- Subsection IDs: `subsec-<slug>`.
- Task labels in exercises: `<chapter-slug>-coding-<functionName>`, camelCase on the function.
- Function names in exercises: camelCase (e.g., `firstAndLast`, `runningTotal`, `indexOfMax`).
- Never overwrite earlier-approved files silently. When re-drafting, surface the change as an edit proposal.

---

## 12. Canonical chapters for reference

When drafting a new chapter, read the latest approved versions of:

- `chp-welcome-to-matlab.txt`, `chp-top-down-programming.txt`, `chp-conditional-flow.txt`, `chp-looping-flow.txt` for tone and intro/takeaway structure.
- `chp-vectors.txt` and its three section files for the current canonical style. This chapter is the closest match for any future chapter that introduces a data structure.
- `exercises-looping-flow.txt` and `exercises-vectors.txt` for exercise format and structure.

Start every new chapter by reading these files fresh, not from memory.
