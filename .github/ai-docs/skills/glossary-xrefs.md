# Skill: Add Glossary Cross-References

Use this skill when adding `<xref>` tags from section files to existing glossary items in `source/aa-bookends/glossary.ptx`.

This skill is a follow-up to `glossary-items.md`: first create or verify the glossary entries, then sweep selected section files and link important narrative uses back to those entries.

## Inputs

- A specified list of section files, usually `source/c*-*/sec-*.ptx`.
- The current glossary file, usually `source/aa-bookends/glossary.ptx`.
- Optional notes about terms to include, terms to skip, or sections where links should be avoided.

## Goal

Add glossary cross-references at useful narrative points without cluttering the textbook. A good glossary link helps a student recover the meaning of a term at the moment it matters.

## Default linking pattern

Use the project’s existing convention if nearby files already show one. If there is no clear local convention, use an inline `<xref>` that preserves the visible term:

```xml
<xref ref="gi-term-slug" text="custom">visible term</xref>
```

Use the exact `xml:id` from the matching glossary entry as the `ref` value.

## Procedure

1. Read `glossary.ptx` and build a map of glossary entries:
   - `xml:id`, such as `gi-equilibrium-solution`;
   - entry title, such as `Equilibrium Solution`;
   - likely textual variants, such as lowercase, plural, adjective forms, or common abbreviations.
2. Sweep each specified section file for meaningful narrative uses of those terms.
3. Prefer the first substantial use of a glossary term in each section or subsection after the term has been introduced.
4. Add no more than one glossary link per term per section unless repeated links are clearly useful for a long or conceptually dense section.
5. Preserve the original visible wording whenever possible.
6. Do not change the mathematical meaning, grammar, capitalization, or punctuation of the surrounding sentence.
7. Do not add duplicate links where the term is already inside an `<xref>` or otherwise linked.
8. Summarize the links added and any candidate terms intentionally skipped.

## Where to add links

Good locations include:

- explanatory narrative paragraphs;
- conceptual summaries;
- reminders of previously introduced ideas;
- places where students may need to recall a definition;
- method-selection discussions where terminology controls the next step.

Poor locations include:

- titles and headings;
- raw displayed equations;
- long derivations where links interrupt the algebra;
- figure, image, audio, video, or generated interactive blocks;
- exercises and solutions unless the task explicitly asks to link them;
- glossary entries themselves;
- every repeated occurrence of the same term.

## First introduction versus later use

When a section introduces a term for the first time with `<term>`, usually leave that first introduction alone unless the local convention explicitly nests or combines `<term>` and `<xref>`. Prefer linking a later explanatory use of the same term.

If the term is used in a later section as prior vocabulary, the first meaningful occurrence in that later section is usually a good candidate for an `<xref>`.

## Variant handling

Glossary titles and narrative uses may not match exactly. Link variants only when the reference is unambiguous.

Examples:

- `equilibrium solution` may match glossary entry `Equilibrium Solution`.
- `equilibrium solutions` may match the same entry if the plural is grammatical.
- `ODE` may match `Ordinary Differential Equation` only if the abbreviation is clearly established.

Do not force a link when a word has a different local meaning or when a term is part of a different compound phrase.

## XML safety

- Preserve all existing IDs, labels, references, and attributes.
- Do not edit inside tag brackets unless intentionally adding the `<xref>` wrapper.
- Preserve entity escapes such as `&amp;`, `&lt;`, and `&gt;`.
- Avoid rewriting entire paragraphs just to add a link.
- Do not wrap across block boundaries or across existing inline elements in a way that could invalidate XML.

## Output notes

When producing a PR or patch, summarize:

- glossary entries used as link targets;
- section files updated;
- terms linked in each file;
- candidate terms skipped because they were already linked, ambiguous, too repetitive, or located in unsafe XML contexts.

## Testing

Do not assume a full PreTeXt build is available in restricted environments. Instead, at minimum verify:

- every `ref` matches an existing glossary `xml:id`;
- inserted `<xref>` tags are properly nested;
- no duplicate links were added near existing links;
- XML remains well-formed for each edited file where local validation is practical.
