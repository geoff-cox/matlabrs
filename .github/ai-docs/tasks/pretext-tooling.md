# PreTeXt Tooling, Scripts, Refactoring, and Debugging Task Guide

Use this guide for Python scripts, JavaScript utilities, PreTeXt build/debugging help, XML refactoring, file renaming, repository cleanup, or workflow automation.

## Goal

Provide safe, concrete, testable tooling support for a PreTeXt textbook repository. Prefer practical scripts, staged refactors, clear edge-case handling, and robust validation over vague advice.

## Repository context

Common project structure:

- `project.ptx` — project manifest.
- `source/` — modular PreTeXt XML source.
- `publication/` — publication and build configuration.
- `assets/` — supporting media, styles, scripts, and data.
- `processing-tools/` — helper scripts and conversion utilities.
- PreTeXt CLI — build system.
- Runestone output — used where relevant.

## Python script style

For Python scripts:

- use `argparse`;
- include clear command-line usage;
- support dry-run mode for destructive operations;
- validate inputs before modifying files;
- print a summary of planned changes;
- fail safely on duplicate target filenames;
- use `pathlib`;
- handle encodings explicitly, usually UTF-8;
- keep functions small and named by responsibility.

For refactoring scripts, prefer scan, report, validate, apply, and then validate again.

## XML and PreTeXt handling

When working with XML:

- preserve indentation when possible;
- avoid unnecessary rewrites of whole files;
- avoid changing IDs unless requested;
- be careful with namespaces and includes;
- do not assume every `.ptx` file is a complete standalone XML document;
- explain when regex is unsafe and an XML parser is preferable.

For PreTeXt merges and includes, distinguish source fragments from full XML trees, preserve parent-file indentation when possible, validate merged output, and warn when XInclude support depends on a specific parser/library.

## Refactoring naming conventions

Treat chapter folder or ID renames as cross-file refactors. A safe refactor should:

1. build a rename map;
2. detect collisions;
3. update references across relevant files;
4. rename folders and files;
5. validate IDs and references;
6. run or recommend a PreTeXt build.

Do not recommend large manual find/replace for multi-chapter refactors.

## Debugging style

When given an error message:

1. identify the likely cause;
2. explain it briefly;
3. give the minimal fix;
4. include verification commands;
5. mention only relevant alternatives.

For example, for missing Cairo dependencies in Codespaces, focus on the system packages needed for `pycairo`, not a generic Python packaging tutorial.

## Git and GitHub

Recommend safe sequencing: status, pull/rebase, branch, commit, test. Include VS Code-friendly steps when appropriate.

## Quality checks

- Commands are concrete.
- Destructive steps are gated or dry-run capable.
- Paths are configurable.
- Edge cases are handled.
- Testing procedure is clear.
- Advice fits a PreTeXt repository rather than a generic web project.