# Section Revision Task Guide

Use this guide when revising, tightening, reorganizing, or drafting PreTeXt textbook sections.

## Goal

Produce polished, student-facing PreTeXt that improves clarity, narrative flow, mathematical correctness, and instructional value while preserving the author’s intent.

## Typical inputs

The user may provide a full `<section>`, a subsection, a partial draft, a chapter file, or a conceptual goal. They may also ask to ignore examples, exercises, images, solutions, tasks, or asides.

## Default output

Return revised PreTeXt XML in a code block. For full rewrites, provide a complete replacement block. For targeted edits, provide only the replacement excerpt unless a larger rewrite is clearly needed.

## Procedure

1. Identify the instructional purpose of the section.
2. Remove or merge redundant paragraphs.
3. Improve the opening so it motivates the section and previews the main idea.
4. Add transitions where the narrative jumps too quickly.
5. Make definitions precise but readable.
6. Check all mathematical claims.
7. Use structured, labeled steps only for complex methods.
8. Preserve identifiers unless renaming is explicitly requested.
9. End with a useful summary, transition, or checkpoint when appropriate.

## Style

Write for college sophomores in an introductory MATLAB/programming course. Use short, purposeful paragraphs and a conversational instructor voice. Explain why a concept matters, not only what it is.

Prefer motivation such as:

```xml
<p>
    We have already seen that a differential equation connects a function to one or more of
    its derivatives. In this section, we look more carefully at the language used to describe
    those equations, so that we can compare different types of equations more efficiently.
</p>
```

Avoid generic openings such as:

```xml
<p>
    This section will cover terminology. The terminology is important and should be learned.
</p>
```

## Worked examples

Use structured, labeled steps for complex methods such as undetermined coefficients, Laplace transform methods, piecewise forcing functions, systems methods, and long coefficient-matching examples. Simpler examples should flow naturally in prose.

## Redundancy control

If the same explanation appears in nearby sections, keep the earliest occurrence as the main conceptual explanation and use brief reminders or cross-references later. This is especially important in the Laplace transform chapters.

## Quality checks

- XML remains valid and locally consistent.
- Existing `xml:id`, `label`, and `ref` targets are preserved.
- Math notation matches nearby sections.
- The prose is more student-facing, not merely more formal.
- The revision reduces rather than redistributes redundancy.
- Any structural suggestions are brief and actionable.