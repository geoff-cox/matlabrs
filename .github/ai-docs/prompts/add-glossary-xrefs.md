# Prompt Template: Add Glossary Cross-References

```text
Open a PR that applies `.github/ai-docs/skills/glossary-xrefs.md` to add glossary cross-references in the following section files:

- [section file]

Use glossary entries from:

- `source/aa-bookends/glossary.ptx`

Notes:
- First verify that each `<xref ref="...">` target exists as a glossary `xml:id`.
- Use `text="custom"` when preserving the visible term (e.g., `<xref ref="gi-term-slug" text="custom">visible term</xref>`); use `text="title"` to auto-generate the glossary entry title.
- Prefer the first meaningful narrative use of a term in each section or subsection.
- Do not over-link repeated occurrences.
- Avoid titles, displayed equations, figure/image/audio/video blocks, generated interactive blocks, exercises, and solutions unless explicitly requested.
- Preserve visible wording and surrounding punctuation.
- Do not attempt a full PreTeXt build if external service/firewall errors are unavoidable; instead validate XML structure, `ref` targets, and summarize limitations.
```
