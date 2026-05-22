# Reading and Checkpoint Questions Task Guide

Use this guide when creating reading prep questions, checkpoint questions, conceptual questions, multiple-choice items, multiple-select items, card-sort prompts, placement suggestions, or feedback.

## Goal

Create questions that help students read actively, check conceptual understanding, and notice the structure of a program before doing full exercises.

## Defaults

When the user asks for a set of questions and gives no number, produce ten questions.

## Question categories

Reading prep questions appear before or near the beginning of a section. They should help students notice definitions, assumptions, notation, and motivating ideas.

Inter-narrative checkpoint questions appear inside the narrative after an important idea, example, or transition. They should be brief and reinforce the point just made.

Placement suggestions should identify natural locations such as after a definition, before a worked example, after a displayed derivation, before introducing a new method, or at the end of a subsection.

## Preferred formats

Use a mixture when appropriate:

- multiple choice;
- multiple select;
- true/false;
- matching;
- card sort;
- ordering;
- select all that apply;
- conceptual computation with light arithmetic.

Multiple-select and card-sort formats are especially useful for method selection, classifying terms, recognizing solution types, and distinguishing homogeneous from nonhomogeneous equations.

## Feedback

Feedback should teach the concept. Avoid feedback that merely says whether the student is correct.

For true/false questions, do not use correctness-signaling words such as “Exactly,” “Correct,” “Nope,” or “Not quite,” because the same feedback may appear regardless of response. Use neutral explanatory feedback.

Prefer:

```xml
<feedback>
    <p>
        The order is determined by the highest derivative that appears in the equation,
        not by the highest power of the dependent variable.
    </p>
</feedback>
```

## Distractors

Distractors should be plausible and diagnostic. Use common student mistakes, such as confusing order with degree, assuming every derivative equation is separable, confusing independent and dependent variables, ignoring initial conditions, applying shift theorems incorrectly, or missing overlap in undetermined coefficients.

When useful, improve weak incorrect choices rather than merely flagging them.

## Existing checkpoint library

If the user says questions already exist in a checkpoint library, do not redraft them. Reference known labels and suggest placement. Draft new questions only for gaps.

## PreTeXt style

- Use short descriptive titles.
- Do not make titles merely repeat question statements.
- Do not wrap the entire problem statement in `<em>`.
- Keep feedback concise and concept-focused.
- Keep the question text student-facing.

## Quality checks

- Each question targets one clear learning objective.
- Each question is answerable from the section narrative.
- The question avoids long computation unless requested.
- The item helps students avoid a predictable error.
- The suggested placement fits the surrounding narrative.