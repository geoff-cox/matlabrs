# Copilot Instructions — Getting Started with MATLAB Programming

This repository contains *Getting Started with MATLAB Programming*, an open-access, student-centered MATLAB programming textbook written in PreTeXt and published through PreTeXt/Runestone workflows.

## Repository map

- `project.ptx` — PreTeXt project manifest and build targets.
- `source/` — modular textbook source. Most authoring work happens here.
- `publication/` — publication and Runestone configuration.
- `assets/` — custom JavaScript, CSS/SCSS, images, data, and interactive assets.
- `processing-tools/` — scripts for TTS, audits, conversion, refactoring, and post-processing.
- `.github/instructions/` — path-specific Copilot instructions.
- `.github/ai-docs/` — task guides, skills, and prompt templates for human-initiated AI work.

## Default behavior

- Preserve PreTeXt structure, IDs, labels, references, and build configuration unless a task explicitly requests changes.
- Do not wholesale reformat XML. Make minimal, local, reviewable edits.
- Prefer complete replacement snippets or small patch plans over vague advice.
- When editing prose, write for college sophomores in an introductory MATLAB/programming course.
- Keep the voice clear, student-facing, and conversational without becoming chatty.
- Check mathematical claims carefully; flag assumptions when a statement is only conditionally true.

## PreTeXt conventions

- Inline math uses `<m>...</m>`.
- Display math uses `<me>...</me>`.
- Multi-line aligned derivations use `<md>` with one `<mrow>` per line.
- In `<md>`, use `\amp =` rather than `&=`.
- Keep `<term>` for important first-use terminology and use `<em>` sparingly.
- Avoid editing generated output directories unless the task explicitly targets them.

## Build and validation

Common commands:

```bash
python -m pip install -r requirements.txt
python -m pretext --version
python -m pretext build -t web
python -m pretext build -t dev
python -m pretext build -t pdf
```

Some builds can fail in restricted-network environments because of external services such as WeBWorK. When this happens, diagnose the configuration instead of rewriting unrelated source.

## Task guidance

Use the task guides in `.github/ai-docs/tasks/` for section writing, review sections, questions and assessment, TTS narration, tooling, interactives, and project documentation. Use `.github/ai-docs/skills/` for focused repeatable skills such as glossary and index work. Use `.github/ai-docs/prompts/` for reusable request templates.

The path-specific files in `.github/instructions/` are intentionally short. Do not duplicate large task guides there; keep automatic Copilot context compact and use the task guides only when relevant.