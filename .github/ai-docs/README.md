# AI Assistance Guide

This directory contains the maintained instruction set for AI-assisted work on *Getting Started with MATLAB Programming*.

## Recommended structure

Use a compact core instruction file plus focused task and skill files.

- `.github/copilot-instructions.md` gives repository-wide context for GitHub Copilot.
- `.github/instructions/*.instructions.md` gives short path-specific Copilot guidance.
- `.github/ai-docs/tasks/*.md` gives detailed task procedures for human-initiated AI work.
- `.github/ai-docs/skills/*.md` gives reusable repeatable skills.
- `.github/ai-docs/prompts/*.md` gives request templates.
- `.github/workflows/*.yml` remains reserved for GitHub Actions and is not part of the AI instruction set.

This split avoids a single overloaded instruction file while keeping related guidance easy to find.

## Directory layout

```text
.github/
├── copilot-instructions.md
├── instructions/
│   ├── pretext-source.instructions.md
│   ├── processing-tools.instructions.md
│   └── web-assets.instructions.md
├── ai-docs/
│   ├── README.md
│   ├── tasks/
│   │   ├── section-revision.md
│   │   ├── review-sections.md
│   │   ├── reading-checkpoints.md
│   │   ├── exercises-assessment.md
│   │   ├── tts-narration.md
│   │   ├── pretext-tooling.md
│   │   ├── interactives-runestone.md
│   │   └── project-docs.md
│   ├── skills/
│   │   ├── glossary-items.md
│   │   ├── glossary-xrefs.md
│   │   └── index-tags.md
│   └── prompts/
│       ├── section-list.md
│       ├── add-glossary-items.md
│       ├── add-glossary-xrefs.md
│       └── add-index-tags.md
└── workflows/
    └── ...
```

## Which file to use

- Revising textbook prose: `tasks/section-revision.md`.
- Writing prerequisite review material: `tasks/review-sections.md`.
- Creating reading/checkpoint questions: `tasks/reading-checkpoints.md`.
- Creating exercises, ODPs, or solutions: `tasks/exercises-assessment.md`.
- Producing narration text: `tasks/tts-narration.md`.
- Debugging scripts, builds, or refactors: `tasks/pretext-tooling.md`.
- Working on JSXGraph, Runestone, Parsons, or slideshows: `tasks/interactives-runestone.md`.
- Drafting READMEs, reports, talks, tutorials, or licensing text: `tasks/project-docs.md`.
- Adding glossary entries: `skills/glossary-items.md`.
- Linking section uses to glossary entries: `skills/glossary-xrefs.md`.
- Adding index entries: `skills/index-tags.md`.

## Common workflows

### Adding glossary entries

Use `skills/glossary-items.md` with `prompts/add-glossary-items.md` when sweeping section files for important terms and adding new entries to `source/aa-bookends/glossary.ptx`.

### Adding glossary cross-references

Use `skills/glossary-xrefs.md` with `prompts/add-glossary-xrefs.md` after glossary entries already exist. This workflow sweeps specified section files and adds `<xref>` tags at useful narrative points where glossary terms are used. It should verify every `ref` target, avoid over-linking, and skip unsafe contexts such as titles, displayed equations, generated interactive blocks, exercises, and solutions unless explicitly requested.

### Adding index entries

Use `skills/index-tags.md` with `prompts/add-index-tags.md` when sweeping section files for concepts that should appear in the textbook index.

## Output expectations

Unless the request says otherwise:

1. produce directly usable material;
2. preserve existing IDs, labels, references, and file organization;
3. use PreTeXt XML for textbook source;
4. use Markdown for AI instructions, documentation, and request templates;
5. keep change notes brief and focused on correctness, pedagogy, maintainability, and testing.

## Obsolete locations

The previous top-level task files and duplicated instruction folders have been consolidated here. New AI guidance should be added under `ai-docs/` unless it is a short path-specific Copilot instruction, in which case it belongs under `.github/instructions/`.
