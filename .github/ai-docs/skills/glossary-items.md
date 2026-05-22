# Skill: Add Glossary Items

Use this skill when adding glossary entries to `source/aa-bookends/glossary.ptx` based on one or more section files.

## Inputs

- Target section files, usually `source/c*-*/sec-*.ptx`.
- Current glossary file, especially nearby entries for style matching.
- Optional notes about terms to include or avoid.

## Procedure

1. Sweep the target section for important terms that may be referenced later.
2. Prefer terms explicitly introduced with `<term>` or emphasized in definitions, objectives, or summaries.
3. For each candidate term, write a concise description based on the surrounding textbook prose.
4. Add a simple example only when it clarifies the definition without bloating the entry.
5. Match the formatting and tone of existing glossary entries.
6. Insert new entries into the appropriate conceptual group in `glossary.ptx`.
7. Do not add duplicate glossary items; update an existing item only when requested.

## Entry pattern

```xml
<gi xml:id="gi-term-slug">
    <title>Term Name</title>
    <p>
        Concise description written in student-facing prose.
    </p>
</gi>
```

## Style

- Keep entries concise and explanatory.
- Use displayed math for important equations that would be hard to read inline.
- Use examples sparingly.
- Do not turn the glossary into a mini-section.

## Testing

Do not assume a full PreTeXt build is available in restricted environments. Instead, check local XML structure, IDs, duplicate entries, and consistency with neighboring glossary items.