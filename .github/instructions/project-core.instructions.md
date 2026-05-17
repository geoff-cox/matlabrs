# Project Core — Global Agent Instructions

**Applies to every task.** Read this file first before any content work.

---

## Repository

An open-access **Introduction to Programming in MATLAB** textbook authored in **PreTeXt XML**.

| Path | Contents |
|------|----------|
| `source/` | All `.ptx` chapter/section files |
| `source/{chpID}-{chpTitle}/` | Chapter folder; contains `chp-*.ptx`, `sec-*.ptx`, `exercises-*.ptx` |
| `publication/` | Build configurations (`publication.ptx`, `runestone.ptx`, `publication-quiz.ptx`) |
| `assets/figures/` | Images and GIFs |
| `project.ptx` | PreTeXt manifest (targets: `web`, `dev`, `pdf`, `runestone`) |
| `requirements.txt` | Python deps (PreTeXt CLI) |

**Build targets**: `pretext build web`, `pretext build dev`, `pretext build pdf`. Use `pretext view web` to preview locally.

---

## XML Editing Guardrails

1. **Preserve identifiers** — never change `xml:id`, `label`, `ref`, or target names unless explicitly asked.
2. **Preserve tag structure** — don't reflow, pretty-print, or restructure XML wholesale.
3. **Preserve entities** — keep `&amp;`, `&lt;`, `&gt;` exactly as written.
4. **Don't touch generated output** — `output/`, `generated-assets/`, `logs/` are build artifacts.
5. **Don't modify tag attributes** inside `<...>` brackets unless the task explicitly requests it.

---

## MATLAB Pedagogy

- **Audience**: Beginners in a first programming course. The book teaches transferable programming concepts using MATLAB as the vehicle.
- **Terminology**: *script* vs *function*; *array* (general) vs *matrix* (2D case); indexing is 1-based.
- **Vectorization vs. loops**: Prefer the most vectorized form that works, but never use loops before they are introduced.
- **Elementwise vs. matrix ops**: Always distinguish `.*`, `./`, `.^` from `*`, `/`, `^`.
- **Column vs. row**: Be explicit when it matters.
- **Function introductions**: Show signature, inputs/outputs, and a small example call.
- **Concept sequencing**: Never use a concept, function, or data structure before the chapter that introduces it.

### Book progression (concept availability by chapter)

1. **Welcome to MATLAB** — desktop, command window, variables, basic arithmetic
2. **Scripts & Functions** — scripts, user-defined functions, scope
3. **Logic, If, & Switch** — relational/logical operators, if/elseif/else, switch
4. **For & While Loops** — for-loops, while-loops, break/continue, accumulation
5. **Vectors** — 1D arrays, indexing, slicing, vectorized operations, aggregate functions
6. **Matrices** — 2D arrays, row/column indexing, nested loops, matrix operations

---

## Writing Style (Student-Facing)

- Plain prose, short sentences. Patient instructor speaking to a beginner.
- Second person ("you") throughout. Sparing first-person plural for forward-references.
- No hype words: avoid "powerful," "elegant," "beautiful," "transformative."
- No meta-commentary about pedagogy — don't announce "aha moments" or "payoffs."
- No announced callbacks — don't write "as you'll recall from Chapter 3..." Just use the tool.
- Commas and periods over em-dashes. Reserve em-dashes for genuine parenthetical asides.
- `<term>` for first use of defined terminology. `<em>` for ordinary emphasis.
- `<pf>` for inline code and function names. Not `<c>`.
- `<m>` for inline math, `<me>` for display math. No unicode math symbols inside `<m>`.

---

## Output Modes

### Mode A — Patch Output (default)
Return the updated PreTeXt content (full file or clearly delimited excerpt) plus a short change log.

### Mode B — Find/Replace JSON
Return a JSON mapping with unique `find` strings for automated replacement:
```json
{
  "source_file": "path/to/file.ptx",
  "mode": "exact",
  "changes": [
    {
      "id": "file-001",
      "find": "UNIQUE STRING FROM PTX",
      "replace": "REPLACEMENT STRING",
      "must_match_count": 1,
      "notes": "optional"
    }
  ]
}
```

Use Mode A for new content and context-dependent edits. Use Mode B for bulk consistent phrasing changes.

---

## Quality Gates (Self-Check)

Before delivering any output:
- [ ] XML is well-formed — no tags accidentally removed or duplicated
- [ ] MATLAB code is correct and would run as written
- [ ] No concept, function, or syntax appears before its chapter of introduction
- [ ] Terminology is consistent with the rest of the book
- [ ] Entities (`&amp;`, `&lt;`, `&gt;`) are preserved
- [ ] All `xml:id`, `label`, and `ref` values are unchanged unless the task requested changes
