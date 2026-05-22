---
applyTo: "source/**/*.ptx"
---

# PreTeXt Source Instructions

Apply these instructions when editing textbook source files under `source/`.

- Preserve `xml:id`, `label`, `ref`, `component`, and other identifiers unless the task explicitly requests a rename.
- Do not wholesale reformat XML. Make local, reviewable edits that preserve surrounding indentation style.
- Do not edit figures, images, audio, video, or generated interactive blocks unless the task specifically targets them.
- Use `<m>` for inline math and `<me>` or `<md>` for displayed math.
- For `<md>` derivations, put each line in its own `<mrow>` and use `\amp =` rather than `&=`.
- Keep prose student-facing, conversational, and suitable for a first-year college student audience.
- Avoid adding advanced terminology unless it is defined in context.
- When revising explanations, improve motivation, transitions, conceptual clarity, and mathematical precision.
- When editing assessments, use concise titles, plausible distractors, and feedback that teaches the concept.
- When editing narration-related text, keep the visible source aligned with any generated TTS narration.