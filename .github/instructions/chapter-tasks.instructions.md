# Chapter Tasks — Actionable Task Definitions

**How to execute specific content tasks.** Always pair with `project-core.instructions.md` and `drafting.instructions.md`. Use `pretext-reference.instructions.md` for XML syntax lookup.

---

## Task 1: Draft a New Section

### When to use
Writing a brand-new section from scratch for an existing or new chapter.

### Inputs
- Topic and chapter context
- What students have and have not yet covered
- Any concept restrictions (e.g., "no arrays," "scalar operations only")

### Steps
1. Ask scoping questions: What's included? What's deferred? What prerequisites exist?
2. Propose a subsection plan (Structure → Examples → Practice Activities → Reading Questions → Coding Exercises) with 3–6 flagged decisions.
3. After approval, draft one subsection at a time per the workflow in `drafting.instructions.md`.
4. Flag 2–4 judgment calls after each subsection.

### Deliverables
- Complete PreTeXt section file following the section skeleton in `pretext-reference.instructions.md`
- Change log summarizing decisions made

---

## Task 2: Refactor an Existing Section

### When to use
Bringing an existing section up to the quality and structure of the canonical template (the for-loops section is the structural reference).

### Inputs
- Target file path: `./source/{chpID}-{chpTitle}/sec-{sectionTitle}.ptx`
- File contents (full or excerpt)
- Goals: tighten prose, add transitions, improve examples, reduce redundancy, align with template structure

### Steps
1. Read the target section and the template section. Identify which subsections exist vs. which are missing.
2. Inventory existing exercises: label, title, difficulty, current location.
3. Triage each exercise: keep as-is, revise, move, or remove (with reasons).
4. Draft one subsection at a time in this order: Practice Activities → Coding Exercises → Reading Questions.
5. Get approval before moving to the next subsection.

### Constraints
- Do not change `xml:id`, `label`, `ref` targets, or file structure.
- Do not modify embedded media blocks unless explicitly instructed.
- Verify no exercise uses concepts not yet covered.

### Deliverables
- Updated PreTeXt (Mode A) or find/replace JSON (Mode B)
- Change log with ~5–12 bullets

---

## Task 3: Write Reading Questions

### When to use
Creating or improving reading checkpoint questions for a section.

### Inputs
- Target section file and its content
- Placement guidance (mid-narrative, end-of-subsection, etc.) if any

### Requirements
- Produce **10–15 questions** per section.
- Mix: ~60% multiple choice (4 choices each), ~25% true/false, ~15% fill-in.
- Each question gets a short, descriptive title (not a restatement of the prompt).
- Every MC choice needs `<feedback>` that teaches the underlying concept.
- Distractors target specific, common student misconceptions — no throwaway wrong answers.
- Concept coverage: syntax recall, when-to-use decisions, tracing/output prediction, bug identification.
- Use `<program language="matlab">` for code snippets inside questions.

### Deliverables
- PreTeXt block of questions with feedback
- Placement suggestions (where they fit and why)

---

## Task 4: Write or Improve Exercises

### When to use
Creating a new exercise set or improving an existing one.

### Inputs
- Target exercises file: `./source/{chpID}-{chpTitle}/exercises-{sectionTitle}.ptx`
- Existing exercise content (if improving)
- Desired difficulty distribution and topic focus

### Requirements
- Maintain a spread: warm-up/routine → conceptual checks → medium synthesis → challenge problems (scaffolded).
- Each exercise follows the standard format: problem statement → I/O table → test cases → solution. (See `pretext-reference.instructions.md` for templates.)
- Steady difficulty trajectory within each block — no sudden jumps.
- Test cases include at least one edge case (empty input, zero, single element, boundary values).
- Solutions show key steps and reasoning, not just final code.
- Avoid repetitive clones unless explicitly desired.
- Prefer exercises that teach one clear point.

### Deliverables
- Updated exercise blocks (Mode A or Mode B)
- Change log: new exercises, modified exercises, solutions added

---

## Task 5: Write Chapter Bookends

### When to use
Writing the introduction and Key Takeaways conclusion for a chapter after all sections are drafted.

### Inputs
- All section files for the chapter
- The chapter's place in the book progression

### Chapter introduction
- 2–4 paragraphs: connect to the prior chapter, motivate the topic, preview sections.
- Use a brief `<dl>` if there are 2–3 major concepts to preview.
- State what students will be able to do by the end.

### Key Takeaways conclusion
- An `<objectives>` block with 4–6 `<li>` items.
- Each takeaway is a single declarative sentence capturing one essential concept.
- Actionable: "Use a for-loop when the number of iterations is known in advance" — not "Understand loops."

---

## Task 6: Exercise Curation and Triage

### When to use
Reviewing an existing exercise inventory and making keep/revise/move/remove decisions.

### Steps
1. List every exercise: label, title, difficulty, current subsection.
2. For each, recommend:
   - **Keep** as-is (use placeholder comments)
   - **Revise** (specify what and how)
   - **Remove** (with reasons: redundant, wrong scope, too trivial, depends on uncovered topics)
   - **Migrate** to a different section or chapter
3. Identify gaps in the difficulty trajectory and propose new problems to fill them.

### Deliverables
- Categorized inventory with recommendations
- Draft new/revised exercises for any identified gaps

---

## Pre-Delivery Checklist

Before delivering any task output, verify:

- [ ] Subsection follows the correct `xml:id` naming pattern
- [ ] All XML tags are balanced (`exercise`/`task`/`choices`/`blocks`/`sage`)
- [ ] Difficulty trajectory is steady — no sudden jumps
- [ ] No exercise uses concepts not yet covered
- [ ] MC distractors target real misconceptions
- [ ] Every MC `<choice>` has `<feedback>`
- [ ] Solutions match the problem specification and produce expected output
- [ ] Sage cells include starter code with clear markers
- [ ] I/O tables use standard column widths
- [ ] Test cases cover edge cases
- [ ] Labels are unique and follow naming conventions
- [ ] No duplicate problems across subsections
