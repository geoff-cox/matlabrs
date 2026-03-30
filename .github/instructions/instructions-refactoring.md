# Refactoring a Chapter to Match the For & While Loops Template

## Sample Prompts

Use these as starting points when requesting refactoring work from an AI agent. Adapt them to your specific chapter.

### Initial orientation prompt
```
I am refactoring the chapter on [TOPIC] (see the attached project files) to align with the
structure and quality of my for-while-loops chapter. The for-loops section (sec-for-loops.txt)
is the canonical structural template. Please read all project files, then summarize:
(A) the current state of the chapter being refactored,
(B) which subsections exist vs. which are missing relative to the template, and
(C) a proposed plan of attack listing each subsection in order of work.
```

### Per-subsection refactoring prompt
```
Please draft a new [Practice Activities / Reading Questions / Coding Exercises] subsection for
[sec-TOPIC.txt]. Use the corresponding subsection in sec-for-loops.txt as a structural template.

Key constraints:
- Students have [not yet covered X / already covered Y].
- [Any syntax or concept restrictions, e.g., "no arrays," "only scalar operations."]
- Solutions should be [visible / hidden] by default.

Treat all existing exercises in this section as a library: problems can be moved, edited,
replaced, or deleted. For existing problems that need no modification, use XML placeholder
comments so I can paste the originals. Write full XML for any new or substantially revised
problems.
```

### Curation / triage prompt
```
Here is the current inventory of exercises in [sec-TOPIC.txt]. Please recommend:
(A) which problems to keep as-is (with placeholder comments),
(B) which to revise and how,
(C) which to remove (with reasons: redundant, wrong scope, too trivial, etc.),
(D) which to migrate to a different section or chapter, and
(E) any new problems needed to fill gaps in the difficulty trajectory.
```

### Chapter introduction / conclusion prompt
```
With the three sections of the [TOPIC] chapter now drafted, please write:
(A) A chapter introduction (2–4 paragraphs) that motivates the topic, previews the sections,
    and states what students will be able to do by the end.
(B) A Key Takeaways conclusion with 4–6 bullet points summarizing the essential concepts.
Use the chp-for-while-loops.txt file as a template for tone and structure.
```

---

## Chapter Architecture

Every chapter follows this top-level structure:

```xml
<chapter xml:id="chp-TOPIC">
    <title>Chapter Title</title>
    <introduction> ... </introduction>
    <xi:include href="sec-SECTION-1.ptx" />
    <xi:include href="sec-SECTION-2.ptx" />
    <!-- additional sections as needed -->
    <conclusion>
        <title>Key Takeaways</title>
        <objectives xml:id="takeaways-TOPIC"> ... </objectives>
    </conclusion>
</chapter>
```

**Introduction**: 2–4 paragraphs. Connects to prior chapter, motivates the topic, previews
sections with a brief `<dl>` if there are 2–3 major concepts, and states learning outcomes.

**Conclusion**: A `<objectives>` block with 4–6 `<li>` items. Each takeaway is a single
declarative sentence capturing one essential concept. Avoid vague bullets like "understand loops";
prefer actionable ones like "Use a for-loop when the number of iterations is known in advance."

---

## Section Architecture

Each `<section>` follows this subsection order:

| Order | Subsection | xml:id pattern | Purpose |
|-------|-----------|----------------|---------|
| 1 | 🧱 Structure | `subsec-TOPIC-structure` | Syntax, rules, assemblage box, inline reading checkpoints |
| 2 | 👀 Examples | `subsec-TOPIC-examples` | 2–4 worked examples with expanded traces |
| 3 | 🧑🏻‍💻 Practice Activities | `subsec-TOPIC-practice-activities` | Scaffolded drills, solutions visible by default |
| 4 | 📖 Reading Questions | `TOPIC-reading-questions` | Conceptual MC/TF/fill-in quizzes |
| 5 | 💻 Coding Exercises | `TOPIC-coding-exercises` | Primary assignments, solutions hidden by default |

### Structure subsection
- Open with an `<assemblage>` box containing the syntax template, key rules as `<ul>`, and
  any important terminology marked with `<term>`.
- Follow with 2–5 inline `<exercise>` tasks (MC or T/F) that check reading comprehension of
  the structure just introduced. These are embedded reading checkpoints, not graded assignments.
- If the section introduces a comparison (e.g., for vs. while), place it here as a
  `<paragraphs>` block with a comparison `<tabular>`.

### Examples subsection
- Use `<example>` tags with `<title>` and `<statement>`.
- Show side-by-side code using `<sidebyside widths="48% 48%">` with `<stack>` children.
- For accumulation/trace examples, show both the loop version and the "expanded/written out"
  version so students can see every iteration.
- Follow the examples with 1–2 practice `<exercise>` tasks that ask students to replicate the
  pattern they just saw.

### Practice Activities subsection
- **Solution visibility**: `component="example-solution"` (visible by default).
- **Scaffolding progression** (follow this order):
  1. **Trace / Expand**: Given a loop, write out each iteration by hand.
  2. **Convert / Rewrite**: Fill-in-the-blank `<sage>` cells converting one form to another.
  3. **Write from scratch**: Open-ended `<sage>` cells with starter code.
  4. **Parsons problems**: `<blocks>` ordering exercises for code assembly.
  5. **Multi-step activities**: Scaffolded sequences where each task builds on the previous.
  6. **Function-writing**: Progressively harder functions with I/O tables and test cases.
- Use `<sage language="octave">` cells for interactive exercises. Provide starter code with
  `% ==== Type your code here ====` markers.
- Include expected output so students can self-check: "When done, evaluate and confirm it
  prints `total = 15`."

### Reading Questions subsection
- Wrap in `<reading-questions>`, not `<subsection>`.
- Target 10–15 questions per section.
- **Question type mix**: ~60% multiple choice, ~25% true/false, ~15% fill-in.
- Every MC question needs **4 choices** with targeted distractors based on common student
  misconceptions. Every choice needs `<feedback>` explaining why it's right or wrong.
- T/F questions use `<statement correct="yes">` or `<statement correct="no">`.
- Fill-in questions use `<fillin answer="..." mode="string" width="N"/>` inside a code block.
- **Concept coverage** should include:
  - Syntax recall (what does command X do?)
  - When-to-use decisions (which tool fits this scenario?)
  - Tracing / output prediction (what does this code print?)
  - Bug identification (what's wrong with this code?)
  - Conversion (rewrite X as Y)

### Coding Exercises subsection
- Wrap in `<exercises>`, not `<subsection>`.
- **Solution visibility**: Solutions use bare `<solution>` (hidden by default), NOT
  `component="exercise-solution"`.
- **Organization**: Group related problems under a shared `<exercise>` tag containing
  multiple `<task>` children. Use 1–2 exercise groups (e.g., "Foundational" and "Extended").
- **Difficulty trajectory**: Steady progression within each group. First group should be
  achievable by all students; second group should challenge strong students.
- **Problem specification format** (use consistently):
  1. Problem description in prose.
  2. I/O table using `<tabular>` with columns: Inputs/Outputs, variable name, type, description.
  3. Side-by-side test cases and expected output.
  4. Solution in `<solution>` tag.

---

## XML Conventions

### Element usage
| Element | When to use |
|---------|------------|
| `<pf>` | Inline code references (variable names, keywords, short expressions) |
| `<program language="matlab">` | Code blocks (non-interactive) |
| `<sage language="octave">` | Interactive code cells students can edit and run |
| `<c>` | Short inline code in running text (output values, filenames) |
| `<term>` | First introduction of a technical term |
| `<m>` | Inline math |
| `<me>` | Display math (centered equation) |
| `<md><mrow>` | Multi-line display math |
| `<pre>` | Expected console output |

### I/O table template
```xml
<tabular valign="top" top="minor">
    <col width="11%" halign="right" />
    <col width="15%" halign="left" />
    <col width="28%" halign="center" />
    <col width="46%" halign="left"/>
    <row>
        <cell>Inputs:</cell>
        <cell><p><pf>varName</pf></p></cell>
        <cell><p>(1x1) double</p></cell>
        <cell><p>description of the input</p></cell>
    </row>
    <row bottom="minor">
        <cell>Outputs:</cell>
        <cell><p><pf>varName</pf></p></cell>
        <cell><p>(1x1) double</p></cell>
        <cell><p>description of the output</p></cell>
    </row>
</tabular>
```

### Test case template
```xml
<sidebyside widths="48% 50%">
    <stack>
        <p>Test Cases ⤵︎</p>
        <program language="matlab">
            result = myFunction(input1)
            result = myFunction(input2)
        </program>
    </stack>
    <stack>
        <p>Expected ⤵︎</p>
        <program language="matlab">
            result = expectedValue1
            result = expectedValue2
        </program>
    </stack>
</sidebyside>
```

### Placeholder comment format
When an existing problem needs no modification, use this placeholder:
```xml
<task label="original-label">
    <!-- PASTE: "Original Problem Title" — no modifications needed -->
</task>
```

---

## Refactoring Workflow

1. **Read all files** in the chapter and the template chapter. Identify the current subsection
   structure and compare it to the template.
2. **Inventory existing problems**: List every exercise, noting its label, title, difficulty,
   and which subsection it currently lives in.
3. **Triage**: For each problem, decide: keep as-is, revise, move, or remove. Document
   reasons for removals (redundant, wrong scope, depends on uncovered topics, too trivial
   as standalone).
4. **Draft one subsection at a time** in this order: Practice Activities → Coding Exercises
   → Reading Questions. Get approval before moving to the next.
5. **Check constraints**: Before finalizing, verify that no exercise uses syntax or concepts
   students haven't been introduced to yet (e.g., arrays, vectors, strings, file I/O).
6. **Verify XML**: Confirm all tags are balanced (exercise/task/choices/blocks/sage/etc.)
   before delivering.

---

## Quality Checklist

Before delivering any subsection, verify:

- [ ] Subsection follows the correct xml:id naming pattern
- [ ] All XML tags are balanced (exercises, tasks, choices, blocks, sage)
- [ ] Difficulty trajectory is steady and fair (no sudden jumps)
- [ ] No exercise uses concepts not yet covered
- [ ] MC distractors target real student misconceptions (not absurd wrong answers)
- [ ] Every MC choice has `<feedback>`
- [ ] Solutions match the problem specification and produce the expected output
- [ ] Sage cells include starter code with clear markers
- [ ] I/O tables use the standard column widths
- [ ] Test cases cover edge cases (zero, one, boundary values)
- [ ] Labels are unique and follow the naming convention
- [ ] No duplicate problems across subsections
