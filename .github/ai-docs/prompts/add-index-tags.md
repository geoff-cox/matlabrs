# Prompt Template: Add Index Tags

```text
Open a PR that applies `.github/ai-docs/skills/index-tags.md` to add index entries to the following section files:

- [section file]

Notes:
- Add `<idx>` tags only where the surrounding PreTeXt structure safely supports them.
- Prefer important first appearances, definitions, method names, and conceptual distinctions.
- Avoid duplicate or overly dense index entries.
- Flag concepts that should be indexed but cannot be safely tagged in the current source structure.
- Do not attempt a full PreTeXt build if external service/firewall errors are unavoidable; instead validate XML structure and summarize limitations.
```