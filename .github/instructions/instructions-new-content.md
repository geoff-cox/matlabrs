# Generating New Content for a PreTeXt MATLAB/Octave Textbook

## Sample Prompts

Use these as starting points when requesting new content from an AI agent. The key to effective
prompts is front-loading constraints and providing concrete examples of the target format.

### New section from scratch
```
I need a new section on [TOPIC] for my introductory MATLAB/Octave textbook authored in PreTeXt
XML. The section should follow the same structure as sec-for-loop.txt (attached): Structure →
Examples → Practice Activities → Reading Questions → Coding Exercises.

Key constraints:
- Target audience: introductory-level undergraduates, first programming course.
- Students have already covered: [list prior topics].
- Students have NOT yet covered: [list future topics — especially arrays/vectors if relevant].
- All exercises must use scalar operations only. Array syntax is allowed only in standard
  built-in function calls (e.g., randi([0 10])).
- Solutions in Practice Activities are visible by default (component="example-solution").
- Solutions in Coding Exercises are hidden by default (bare <solution> tag).

Please begin with the Structure and Examples subsections.
```

### New exercise set for an existing section
```
Please write [6–10] new coding exercises for [sec-TOPIC.txt] at the [Coding Exercises] level.

Requirements:
- Organize as <task> children of a single <exercise> tag.
- Steady difficulty trajectory: start with problems that apply one concept, end with problems
  that combine 2–3 concepts or require helper functions.
- Each problem must include: prose description, I/O table, side-by-side test cases with
  expected output, and a solution.
- Test cases should cover normal cases and at least one edge case (e.g., n=0, n=1, empty input).
- [List any concept restrictions.]
- [List any thematic preferences, e.g., "number theory," "simulation," "financial."]
```

### New reading questions
```
Please write [10–15] reading questions for [sec-TOPIC.txt]. Use the reading questions in
sec-for-loop.txt as a format template. Target these concept areas:
1. [Concept area 1, e.g., "syntax recall"]
2. [Concept area 2, e.g., "tracing / output prediction"]
3. [Concept area 3, e.g., "bug identification"]
4. [Concept area 4, e.g., "when-to-use decisions"]

Question type mix: ~60% MC (4 choices each), ~25% T/F, ~15% fill-in.
Every distractor must target a specific, common student misconception — no throwaway wrong
answers.
```

### Scaffolded multi-step activity
```
Please create a scaffolded multi-step practice activity on [TOPIC/APPLICATION] for the Practice
Activities subsection. The activity should have [3–6] tasks that build on each other:
- Task 1 should be achievable by any student who read the section.
- Each subsequent task should add one new element.
- The final task should combine everything into a complete function.
- Include sage cells with starter code and expected output for self-checking.
- All solutions should use component="example-solution" (visible by default).
```

### Worked example
```
Please write a worked example for the Examples subsection of [sec-TOPIC.txt]. The example
should demonstrate [SPECIFIC PATTERN, e.g., "accumulation with a running product"].

Include:
- A side-by-side showing the loop version and the "expanded/written out" version.
- A brief explanation of what happens at each iteration.
- Use <example> with <title> and <statement> tags.
```

---

## Authoring Environment

| Property | Value |
|----------|-------|
| Format | PreTeXt XML |
| Language | MATLAB / GNU Octave |
| Interactive cells | `<sage language="octave">` |
| Audience | Introductory undergraduates, first programming course |
| Constraint | Scalar operations only (no explicit array/vector discussion unless in later chapters) |

### Array syntax rule
Students have not been introduced to arrays or vectors. Array syntax is permitted ONLY when
it appears implicitly in standard built-in function calls:
- ✅ `randi([0 10])` — array syntax inside a built-in call
- ✅ `for k = 1:n` — colon operator in a loop header
- ❌ `A = [1 2 3 4 5]; total = sum(A);` — explicit array creation
- ❌ `guesses(idx)` — array indexing
- ❌ `length(v)` — array function on a user-created variable

This constraint relaxes in later chapters. Always check which chapter you are writing for.

---

## Content Design Principles

### Difficulty trajectories
Every problem set should follow a steady, fair difficulty curve:
- **No sudden jumps**: If problem N requires one concept, problem N+1 should not require three
  new ones.
- **No plateaus**: Avoid sequences of 4+ problems at the same difficulty.
- **Scaffold before challenge**: If a hard problem requires technique X, an earlier problem
  should have introduced X in a simpler context.

### Distractor design for MC questions
Every wrong answer should represent a **real student misconception**, not an obviously absurd
choice. Common misconception categories:
- **Off-by-one**: Loop runs N vs N+1 vs N-1 times
- **Boundary confusion**: `<` vs `<=`, exits AT the threshold vs PAST it
- **Timing errors**: Condition checked before vs after iteration
- **Missing update**: Forgetting the counter increment in a while-loop
- **Scope confusion**: break vs return, continue vs break
- **Initialization errors**: Starting accumulator at 1 instead of 0 (or vice versa)

### Feedback quality
Every `<feedback>` element should:
1. Explain WHY the answer is right or wrong (not just "Correct!" or "Incorrect").
2. Name the specific misconception if the answer is wrong.
3. Point toward the correct reasoning without giving away the answer.

Example of good feedback:
```xml
<feedback><p>After k = 4, total is 10, which is less than 15, so the loop continues
to the next iteration.</p></feedback>
```

Example of bad feedback:
```xml
<feedback><p>Incorrect. Try again.</p></feedback>
```

### Problem specification format
Every coding exercise (Practice Activity or Coding Exercise) that asks students to write a
function must include these elements in order:

1. **Prose description**: What the function does, in plain English. Include the algorithm
   or approach if it's not obvious.
2. **I/O table**: Tabular specification of inputs and outputs with variable names, types,
   and descriptions. Use the standard column widths (11%/15%/28%/46%).
3. **Test cases**: Side-by-side `<program>` blocks showing function calls and expected output.
   Include at least one edge case.
4. **Solution**: Complete working code.

### Sage cell design
Interactive `<sage>` cells should:
- Include starter code that sets up the problem (initializes variables, defines inputs).
- Mark where students should write code with `%─── TYPE YOUR CODE HERE ───%` markers.
- Include a `fprintf` call at the end so students can self-check output.
- NOT include the solution — that goes in a separate `<solution>` tag.

---

## XML Reference

### Section skeleton
```xml
<section xml:id="sec-TOPIC">
    <title>Section Title</title>

    <introduction>
        <!-- Motivating example, brief overview -->
    </introduction>

    <subsection xml:id="subsec-TOPIC-structure">
        <title>🧱 Structure</title>
        <assemblage xml:id="TOPIC-structure">
            <title>Structure Title</title>
            <!-- Syntax template, key rules, terminology -->
        </assemblage>
        <!-- 2-5 inline reading checkpoint exercises -->
    </subsection>

    <subsection xml:id="subsec-TOPIC-examples">
        <title>👀 Examples</title>
        <!-- 2-4 worked examples using <example> -->
    </subsection>

    <subsection xml:id="subsec-TOPIC-practice-activities">
        <title>🧑🏻‍💻 Practice Activities</title>
        <!-- Scaffolded exercises with visible solutions -->
    </subsection>

    <reading-questions xml:id="TOPIC-reading-questions">
        <title>📖 Reading Questions</title>
        <!-- 10-15 MC/TF/fill-in questions -->
    </reading-questions>

    <exercises xml:id="TOPIC-coding-exercises">
        <title>💻 Coding Exercises</title>
        <!-- Primary assignments with hidden solutions -->
    </exercises>

</section>
```

### Element quick reference
| Element | Purpose | Example |
|---------|---------|---------|
| `<pf>` | Inline code | `<pf>for k = 1:n</pf>` |
| `<c>` | Short inline code in prose | `prints <c>x = 5</c>` |
| `<program language="matlab">` | Non-interactive code block | Displayed examples, solutions |
| `<sage language="octave">` | Interactive editable cell | Practice activities |
| `<term>` | First use of technical term | `<term>accumulation</term>` |
| `<m>` | Inline math | `<m>n! = 1 \cdot 2 \cdots n</m>` |
| `<me>` | Display math | `<me>\sum_{k=1}^n k</me>` |
| `<pre>` | Expected console output | `<pre>total = 15</pre>` |
| `<assemblage>` | Highlighted reference box | Syntax summaries, key rules |
| `<fillin>` | Fill-in-the-blank input | `<fillin answer="x <= 100" mode="string"/>` |

### Solution visibility
| Context | Tag | Behavior |
|---------|-----|----------|
| Practice Activities | `<solution component="example-solution">` | Visible by default |
| Coding Exercises | `<solution>` | Hidden by default |
| Inline reading checkpoints | `<feedback>` on choices | Always visible after answering |

### Exercise organization
```xml
<!-- Single-exercise with multiple tasks (preferred for related problems) -->
<exercise label="exercise-group-label">
    <title>Group Title</title>
    <task label="task-1-label">
        <title>Problem Title</title>
        <statement> ... </statement>
        <solution> ... </solution>
    </task>
    <task label="task-2-label"> ... </task>
</exercise>

<!-- Standalone exercise (use for unrelated problems or Parsons blocks) -->
<exercise label="standalone-label">
    <title>Problem Title</title>
    <statement> ... </statement>
    <blocks> ... </blocks>  <!-- Parsons problem -->
</exercise>
```

### Parsons problem template
```xml
<exercise label="parsons-label">
    <title>Problem Title</title>
    <statement>
        <p>Put the blocks in order to create a script that [description].</p>
        <p><em>Use correct indentation to show which lines are inside the loop.</em></p>
    </statement>
    <blocks>
        <block><cline>first_line;         </cline></block>
        <block><cline>for k = 1:n         </cline></block>
        <block><cline>    body_line;      </cline></block>
        <block><cline>end                 </cline></block>
    </blocks>
</exercise>
```

Note: To group lines that must stay together (e.g., an `end` that closes both an `if` and a
loop), place them in the same `<block>` with multiple `<cline>` elements.

### Placeholder format for existing problems
When an existing problem needs no modification, use this in place of the full XML:
```xml
<task label="original-label">
    <!-- PASTE: "Original Problem Title" — no modifications needed -->
</task>
```
Include enough context (title, original label) for the author to locate and paste the original.

---

## Writing Style

### Prose
- Direct and concise. Prefer "Write a function that..." over "In this exercise, you will
  write a function that..."
- Use second person ("you") when addressing the student.
- Avoid jargon not yet introduced. If a term is new, mark it with `<term>`.
- When describing algorithms, use plain English first, then show the code.

### Code
- Use standard MATLAB/Octave conventions: `camelCase` for function and variable names.
- Include comments only when they add clarity (not on every line).
- Keep solutions minimal — show the cleanest correct approach, not every possible variation.
- In expanded/trace examples, show the value of variables after each line using `% comments`.

### Mathematical notation
- Use `<m>` for inline math and `<me>` for displayed equations.
- Write summation formulas explicitly before asking students to code them:
  `<me>\sum_{k=1}^n k = 1 + 2 + 3 + \cdots + n</me>`
- When a problem involves a mathematical concept (GCD, Fibonacci, digital root), briefly
  define it and give a concrete numerical example before the problem specification.

---

## Common Pitfalls to Avoid

1. **Accidentally using arrays**: Watch for `length()`, array indexing `v(k)`, `sum()`,
   `max()` on user-created arrays, or explicit array construction `[1 2 3]`. These are only
   allowed in later chapters.
2. **Inconsistent solution visibility**: Practice Activities use `component="example-solution"`;
   Coding Exercises use bare `<solution>`. Mixing these up hides or reveals answers at the
   wrong time.
3. **Unbalanced XML tags**: Always verify tag balance before delivering. Pay special attention
   to `<exercise>/<task>`, `<choices>/<choice>`, `<blocks>/<block>`, and `<sage>/<input>`.
4. **Duplicate labels**: Every `label` attribute must be unique across the entire textbook.
   Use descriptive, namespaced labels like `while-loop-activity-expand-3`.
5. **Missing feedback**: Every `<choice>` in an MC question must have a `<feedback>` child.
   Every T/F `<statement>` must have a sibling `<feedback>`.
6. **Throwaway distractors**: "MATLAB crashes" or "It prints nothing" are rarely useful
   distractors. Each wrong answer should represent a plausible misunderstanding.
7. **Difficulty spikes**: Review the full problem list in order before finalizing. If problem
   3 is trivial and problem 4 requires nested loops with accumulators, insert a bridge problem.
8. **Teaching in the exercises**: Coding Exercises should test skills, not introduce them.
   If an exercise requires a technique not covered in Structure/Examples, it belongs in
   Practice Activities first.
