# Exercises, ODPs, Solutions, and Assessment Task Guide

Use this guide when creating or revising exercises, solutions, ODP/PBG questions, proficiency-based assessment items, question-library classifications, or deduplication reports.

## Goal

Create mathematically correct and pedagogically useful assessment items that align with the textbook narrative and the intended student skill. Questions should be clear enough for students, structured enough for reuse, and distinct enough to avoid duplicate assessment of the same solution.

## General expectations

Exercises should:

- match the section objectives;
- test one primary idea unless intentionally cumulative;
- use clean numbers unless complexity is part of the learning goal;
- include enough context to make the task unambiguous;
- avoid computational busywork that does not support the concept;
- include solutions or feedback that explain the method, not only the answer.

## PreTeXt output

When producing exercise source, use valid PreTeXt XML. Preserve existing IDs if revising. Keep titles short and descriptive. Use separate code blocks for separate requested tasks.

## Solution style

For full solutions:

- start with the method choice;
- show the key steps;
- include brief explanatory comments;
- avoid narrating every algebraic simplification;
- clearly identify the final result when appropriate.

Use structured labeled steps for long methods such as undetermined coefficients, Laplace transform methods, solving piecewise forcing problems, systems and matrix methods, and coefficient matching.

## ODP / proficiency-based grading context

ODPs are short assessments scored as:

- `P`: Proficient;
- `N`: Not yet proficient.

Questions should target a specific proficiency. Avoid bundling unrelated proficiencies into one item unless the topic explicitly requires synthesis.

## ODP naming and metadata

When generating files for the ODP repository, respect this naming convention:

```text
{topicID}-{typeID}-{countID}.tex
```

where `topicID` identifies the topic, `typeID` is a lowercase letter, and `countID` is a sequential three-digit integer starting at `001`.

Required request fields for new ODP problems normally include `topicID`, `semesterID`, `ioID`, and `weekID`. Interpret codes such as `C5-IC-3-FL26` carefully rather than guessing.

## Canonical question-type categories

Classify by solution expectation, not surface wording.

- `a`: solve for the general solution.
- `b`: solve for the particular solution.
- `c`: classification.
- `d`: method-specific applicability.
- `e`: general conceptual applicability.
- `f`: verifying solutions.
- `g`: sub-method steps.
- `h`: real-world context reference.

A real-world context reference is enough for `h` unless the student is asked to set up the differential equation. Reserve a separate modeling type for setup tasks.

## Duplicate detection

Flag two questions as duplicates if they require students to produce essentially the same solution or answer under the same canonical type, even if the instructions are worded differently.

Check for:

- the same equation with cosmetic changes;
- the same initial condition and final answer;
- the same classification decision;
- the same method applicability decision;
- the same sub-method step;
- the same real-world context with the same mathematical task.

Do not maintain or rely on `question_manifest.csv` unless the user says it has been re-audited. Treat old question-type reports as potentially outdated.

## Quality checks

- The expected answer is clear.
- The required method fits the section.
- The item is not a duplicate of a known existing item.
- The final answer is mathematically correct.
- Notation matches the textbook.
- Metadata and filename conventions are followed exactly.