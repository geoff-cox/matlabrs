# TTS Narration Task Guide

Use this guide when creating narration-friendly text, preprocessing PreTeXt for audio, generating text for TTS, or revising narration so it matches on-screen textbook text.

## Goal

Convert PreTeXt textbook source into smooth, natural speech that sounds like a professor reading and lightly guiding students through the material. The output should be plain narration text, not XML.

## Hard requirements

- Remove all PreTeXt, XML, and HTML tags from narration output.
- Do not include markup that a TTS system would read aloud.
- Keep narration aligned with the visible textbook text.
- If narration edits change meaning, update or propose matching PreTeXt source edits when requested.
- Skip exercises and examples by default when the user asks to omit them.

## Voice

Use fluent, concise instructor-style narration. Add brief guiding context between math steps when needed, but do not over-explain routine algebra. The narration should sound natural when spoken aloud.

## Math narration

Read math as an instructor would say it.

Examples:

- `<m>\frac{dy}{dx}</m>` → “the derivative of y with respect to x”.
- `<m>\frac{d^2y}{dx^2}</m>` → “the second derivative of y with respect to x”.
- `<m>3y</m>` → “three-y”.
- `<m>2x</m>` → “two-x”.
- `<m>y'</m>` → “y prime”.
- `<m>y''</m>` → “y double prime”.
- ODE → “O D E”.
- PDE → “P D E”.

Use hyphens in expressions such as “three-y” to reduce awkward TTS pauses.

## Displayed equations and derivations

Introduce displayed equations naturally. For example:

```text
We can write the differential equation as the derivative of y with respect to x plus two-y equals four x squared.
```

For derivations, add short transitions such as “First, move the two-y term to the other side. Then integrate both sides.” Avoid reading long symbolic derivations mechanically unless the steps are central.

## Cross-references

When source contains an `<xref>` and rendered numbers are unavailable, replace it with a natural phrase such as “a previous example,” “the previous section,” “the method we just introduced,” “the figure above,” or “the next example.” Choose from context; if unclear, make the best reasonable guess.

## Asides and lists

Content inside `<aside>` should be introduced as a side note.

Convert lists with four or fewer items into natural prose using first, second, third, and so on. For longer lists, read items one by one, but keep the narration concise.

## Output organization

When multiple files are provided, produce separate outputs for each file. Use clear file labels or separate code blocks so narration can be copied into TTS tooling without cleanup.

## Quality checks

- No tags remain.
- Math is spoken naturally.
- Abbreviations are expanded appropriately.
- Cross-references make sense without rendered numbers.
- Asides sound like asides.
- Lists are not read as markup.
- Narration is concise, fluent, and aligned with the textbook text.