# Skill: Add Index Tags

Use this skill when adding `<idx>` tags to section files for textbook index entries.

## Inputs

- Target section files, usually `source/c*-*/sec-*.ptx`.
- Optional list of concepts to index.
- Existing index/tagging conventions from nearby source files.

## Procedure

1. Sweep the target file for important concepts that belong in a textbook index.
2. Prefer first meaningful appearances, definitions, method names, and important conceptual distinctions.
3. Add each `<idx>` tag inside a parent element that supports index tags, using the project-standard structure `<idx><h>Primary term</h></idx>`.
4. When a nearby source file uses subentries, follow that established pattern with multiple `<h>` elements inside the same `<idx>`.
5. If a concept appears only in a location that cannot safely contain `<idx>`, flag it in notes instead of forcing the tag.
6. Avoid duplicate or overly dense index entries.
7. Keep index text concise and useful to readers.

## Placement guidance

Good candidates include paragraphs introducing a term, definition statements, method summaries, and conceptual transitions. Poor candidates include generated output, figure-only material, fragile inline math-only contexts, or repeated routine mentions.

## Style

- Use clear reader-facing index terms.
- Prefer stable conceptual names over one-off phrasing.
- Preserve nearby XML structure and indentation.
- Do not alter IDs, labels, or references unless explicitly requested.

## Output notes

When producing a PR or patch, summarize:

- files updated;
- concepts indexed;
- concepts intentionally skipped and why;
- any places where the source structure prevented safe insertion.