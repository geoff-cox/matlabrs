# PreTeXt XML Reference

**Syntax lookup and templates.** Pair with `project-core.instructions.md`.

---

## File and Naming Conventions

| Item | Pattern | Example |
|------|---------|---------|
| Chapter wrapper | `chp-<slug>.ptx` | `chp-looping-flow.ptx` |
| Section file | `sec-<slug>.ptx` | `sec-for-loop.ptx` |
| Exercise file | `exercises-<slug>.ptx` | `exercises-looping-flow.ptx` |
| Chapter ID | `chp-<slug>` | `xml:id="chp-looping-flow"` |
| Section ID | `sec-<slug>` | `xml:id="sec-for-loop"` |
| Subsection ID | `subsec-<slug>` | `xml:id="subsec-for-loop-structure"` |
| Task label (exercises) | `<chapter-slug>-coding-<functionName>` | `label="vectors-coding-runningTotal"` |
| Function names | camelCase | `firstAndLast`, `indexOfMax` |

---

## Chapter Skeleton

```xml
<chapter xml:id="chp-TOPIC">
    <title>Chapter Title</title>
    <introduction>
        <!-- 2–4 paragraphs: connect to prior chapter, motivate topic, preview sections -->
        <!-- Optional <dl> for 2–3 major concepts -->
    </introduction>
    <xi:include href="sec-SECTION-1.ptx" />
    <xi:include href="sec-SECTION-2.ptx" />
    <conclusion>
        <title>Key Takeaways</title>
        <objectives xml:id="takeaways-TOPIC">
            <!-- 4–6 <li> items, each a single declarative sentence -->
            <!-- Actionable: "Use a for-loop when..." not "Understand loops" -->
        </objectives>
    </conclusion>
</chapter>
```

---

## Section Skeleton

```xml
<section xml:id="sec-TOPIC">
    <title>Section Title</title>
    <introduction> <!-- Motivating example, brief overview --> </introduction>

    <subsection xml:id="subsec-TOPIC-structure">
        <title>🧱 Structure</title>
        <assemblage xml:id="TOPIC-structure">
            <title>Structure Title</title>
            <!-- Syntax template, key rules, terminology -->
        </assemblage>
        <!-- 2–5 inline reading checkpoint exercises -->
    </subsection>

    <subsection xml:id="subsec-TOPIC-examples">
        <title>👀 Examples</title>
        <!-- 2–4 worked examples using <example> -->
    </subsection>

    <subsection xml:id="subsec-TOPIC-practice-activities">
        <title>🧑🏻‍💻 Practice Activities</title>
        <!-- Scaffolded exercises with visible solutions -->
    </subsection>

    <reading-questions xml:id="TOPIC-reading-questions">
        <title>📖 Reading Questions</title>
        <!-- 10–15 MC/TF/fill-in questions -->
    </reading-questions>

    <exercises xml:id="TOPIC-coding-exercises">
        <title>💻 Coding Exercises</title>
        <!-- Primary assignments with hidden solutions -->
    </exercises>
</section>
```

---

## Element Quick Reference

| Element | Purpose | Example |
|---------|---------|---------|
| `<pf>` | Inline code / function names | `<pf>sum(v)</pf>` |
| `<c>` | Short inline code in prose | `prints <c>x = 5</c>` |
| `<program language="matlab">` | Static code listing | Solutions, displayed examples |
| `<sage language="octave">` | Interactive editable cell | Practice activities |
| `<term>` | First use of a technical term | `<term>accumulation</term>` |
| `<em>` | Ordinary emphasis | `<em>not</em> the same` |
| `<m>` | Inline math | `<m>n! = 1 \cdot 2 \cdots n</m>` |
| `<me>` | Display math | `<me>\sum_{k=1}^n k</me>` |
| `<pre>` | Expected console output | `<pre>total = 15</pre>` |
| `<assemblage>` | Highlighted reference box | Syntax summaries, key rules |
| `<fillin>` | Fill-in-the-blank input | `<fillin answer="x <= 100" mode="string"/>` |
| `<aside>` | Sidebar note | Sharp-edge warnings, cross-language notes |
| `<kbd>` | Keyboard key | `<kbd>Evaluate</kbd>` |

**Do not use** `clc` or `pause` inside `<sage>` cells — they break browser-based execution.

---

## Solution Visibility

| Context | Tag | Behavior |
|---------|-----|----------|
| Practice Activities | `<solution component="example-solution">` | Visible by default |
| Coding Exercises | `<solution component="exercise-solution">` | Hidden by default |
| Inline reading checkpoints | `<feedback>` on choices | Visible after answering |

---

## Common Templates

### Side-by-side code/result panel

```xml
<sidebyside widths="48% 48%">
    <stack>
        <p>Command ⤵︎</p>
        <program language="matlab">
            v = [10 20 30];
            v(2)
        </program>
    </stack>
    <stack>
        <p>Result ⤵︎</p>
        <pre>
            ans = 20
        </pre>
    </stack>
</sidebyside>
```

### Three-panel parallel examples

```xml
<sidebyside widths="30% 30% 30%">
    <stack> <!-- Example A --> </stack>
    <stack> <!-- Example B --> </stack>
    <stack> <!-- Example C --> </stack>
</sidebyside>
```

### I/O specification table

```xml
<tabular>
    <col width="11%"/><col width="15%"/><col width="28%"/><col width="46%"/>
    <row header="yes"><cell>I/O</cell><cell>Name</cell><cell>Type</cell><cell>Description</cell></row>
    <row><cell>Input:</cell><cell><pf>v</pf></cell><cell>(1xn) double</cell><cell>A numeric vector</cell></row>
    <row><cell>Output:</cell><cell><pf>result</pf></cell><cell>(1x1) double</cell><cell>The computed value</cell></row>
</tabular>
```

### Test cases panel

```xml
<sidebyside widths="60% 38%">
    <stack>
        <p>Test Cases ⤵︎</p>
        <program language="matlab">
            myFunc([1 2 3])
            myFunc([])
        </program>
    </stack>
    <stack>
        <p>Expected ⤵︎</p>
        <pre>
            ans = 6
            ans = 0
        </pre>
    </stack>
</sidebyside>
```

### Multiple-choice reading question

```xml
<exercise label="chkpt-TOPIC-N">
    <title>Descriptive Title</title>
    <statement><p>Question text.</p></statement>
    <choices randomize="yes">
        <choice correct="yes">
            <statement><p>Correct answer</p></statement>
            <feedback><p>Explanation of why this is right.</p></feedback>
        </choice>
        <choice>
            <statement><p>Distractor targeting misconception X</p></statement>
            <feedback><p>Explanation addressing misconception X.</p></feedback>
        </choice>
        <!-- 2 more choices -->
    </choices>
</exercise>
```

### True/False question

```xml
<exercise label="chkpt-TOPIC-tf-N">
    <title>Descriptive Title</title>
    <statement correct="yes"><p>True statement.</p></statement>
    <feedback><p>Explanation.</p></feedback>
</exercise>
```

### Fill-in question

```xml
<exercise label="chkpt-TOPIC-fill-N">
    <title>Descriptive Title</title>
    <statement>
        <p>What value does <pf>x</pf> hold after this code runs?</p>
        <program language="matlab">x = 3 + 4;</program>
        <p><fillin answer="7" mode="string" width="5"/></p>
    </statement>
</exercise>
```

### Sage cell with starter code

```xml
<sage language="octave">
    <input>
        n = 5;
        total = 0;
        %─── TYPE YOUR CODE HERE ───%

        fprintf('total = %i\n', total);
    </input>
</sage>
```

### Parsons problem

```xml
<exercise label="parsons-TOPIC-N">
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

### Placeholder for unmodified existing problem

```xml
<task label="original-label">
    <!-- PASTE: "Original Problem Title" — no modifications needed -->
</task>
```
