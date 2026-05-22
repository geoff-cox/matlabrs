---
applyTo: "processing-tools/**"
---

# Processing Tools Instructions

Apply these instructions when editing scripts or helper tools under `processing-tools/`.

- Prefer small, testable changes over broad rewrites.
- Use `argparse`, `pathlib`, UTF-8 handling, clear error messages, and dry-run mode for destructive Python scripts.
- Validate inputs before modifying files.
- Print summaries of planned or completed changes.
- Fail safely on duplicate output paths, missing files, invalid XML, or ambiguous matches.
- Preserve source formatting where possible, especially for PreTeXt XML transformations.
- Include verification commands or a minimal test case when changing behavior.
- Explain limitations when a full PreTeXt build is not practical because of external services or firewall restrictions.