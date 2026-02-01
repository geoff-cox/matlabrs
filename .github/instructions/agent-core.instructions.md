# AGENT-CORE-MATLAB.md — Global Instructions (apply to every task)

This file is the **project-wide core** for the *Introduction to Programming in MATLAB* PreTeXt book.
Use it as the first block in any agent prompt.

---

## Repo summary
- Repository for an open-access **Introduction to Programming in MATLAB** book written in **PreTeXt XML**.
- Core content is modular `.ptx` in `source/`.
- Builds/outputs are controlled by `project.ptx` and `publication/*.ptx`.
- Supporting scripts/tools may live in `processing-tools/` (e.g., TTS audits, post-processing, conversion helpers).

## High-level info
- Type: PreTeXt XML textbook project.
- Languages: PreTeXt XML (`.ptx`), MATLAB code (embedded), Python/JS/CSS/Markdown for tooling and interactives.
- Tooling/runtime: PreTeXt CLI (Python). PreTeXt may invoke npm for theme/CSS builds. Optional LaTeX for PDF.

## Layout / architecture (where to look)
- `project.ptx`: PreTeXt project manifest (targets such as `web`, `dev`, `pdf`, `runestone` if used).
- `source/`: main PreTeXt sources (`main.ptx`, possibly `main-dev.ptx`, chapter folders).
  - Sections: `./source/{chapterID}-{chapterTitle}/sec-{sectionTitle}.ptx`
  - Exercises: `./source/{chapterID}-{chapterTitle}/exercises-{sectionTitle}.ptx` (or local project convention)
- `publication/`: publication configs (`publication.ptx`, and any platform-specific publications).
- `assets/`: custom styles, JS interactives, data.
- `processing-tools/`: TTS audits and conversion utilities (if present).
- `requirements.txt`: PreTeXt CLI dependency set (project-specific).

## Editing guardrails (agent safety)
1. **Do not alter XML structure unintentionally.**
   - Preserve all tags, attributes, ids, labels, and entity escapes unless the task explicitly requests changes.
   - Never pretty-print/reflow XML wholesale.
2. **Never edit inside tag brackets** `<...>` unless explicitly instructed.
3. **Preserve identifiers**: do not change `xml:id`, `label`, `ref`, target names, publication parameters unless explicitly requested.
4. Avoid modifying generated output directories (e.g., `web/`, `print/`) unless the task explicitly targets them.
5. Preserve escapes/entities exactly: `&amp;`, `&lt;`, `&gt;`, etc.

## Writing style (student-facing)
- Clear, approachable, conversational (use “we” and “you” naturally).
- Prefer short paragraphs, explicit transitions, and concrete examples.
- Define terms the first time they appear (e.g., *variable*, *array*, *function*, *script*).
- Avoid “hand-wavy” correctness: be precise about what MATLAB does.

## MATLAB pedagogy and correctness
- **Assume beginners**: explain the mental model (workspace, command window, scripts, functions).
- Use consistent terminology:
  - *script* vs *function*
  - *array* (MATLAB’s default) vs *matrix* (special case)
  - *indexing is 1-based*
- When presenting MATLAB:
  - Prefer idiomatic vectorized code when it improves clarity, but don’t skip loops before they’re introduced.
  - State preconditions (input shapes/types) when relevant.
  - Distinguish elementwise vs matrix operations: `.*`, `./`, `.^` vs `*`, `/`, `^`.
  - Be explicit about column vs row vectors when it matters.
- If you introduce a function, show:
  - signature, inputs/outputs, and a small example call.

## Code formatting in PreTeXt
- Use PreTeXt code containers consistent with the project, typically:
  - `<program language="matlab"> ... </program>` for code listings
  - `<c> ... </c>` or `<code>` for short inline code (follow local convention)
- Do **not** re-indent entire code blocks unless asked. Avoid breaking alignment in MATLAB examples.

## Output contract (choose one mode per task)
### Mode A — Patch Output
Return:
1. Updated PreTeXt content (full file or clearly delimited excerpt), and
2. A short change log (bullets).

### Mode B — Find/Replace Mapping Output (preferred when requested)
Return a JSON mapping with **unique** `find` strings for automated replacement.
Schema:
```json
{
  "source_file": "path/to/file.ptx",
  "mode": "exact",
  "changes": [
    {
      "id": "file-001",
      "tier": "auto",
      "find": "UNIQUE STRING FROM PTX",
      "replace": "REPLACEMENT STRING",
      "must_match_count": 1,
      "notes": "optional"
    }
  ]
}
```

## Quality gates (self-check)
- XML remains well-formed; no tags accidentally removed/duplicated.
- Examples run as written (or would run with stated assumptions).
- Concepts are introduced in a pedagogically sensible order.
- Terminology is consistent across the section/chapter.
