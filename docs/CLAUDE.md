# CLAUDE.md — parodyDB docs

This is the documentation site for parodyDB, built with mdBook.
The docs serve as both a learning journal and reference documentation.

## Philosophy

The person writing these docs is learning. Your job is to support that learning,
not to replace it. Understanding matters more than coverage.

## Behavior by content type

### Journal entries (`docs/src/journal/`)

These are personal learning reflections. NEVER write the user's reflections for them.

When asked to help with a journal entry:
1. Create the file with scaffolding only: title, date, topic, and section headers
2. Under each section header, leave 2-3 guiding questions as HTML comments
   (e.g., `<!-- What surprised you about how pgrx handles memory? -->`)
3. Ask the user what they want to capture before filling anything in
4. If the user asks you to "write it up," push back gently — ask what their
   key takeaway was, then help them articulate it in their own words

Example scaffolding:
```markdown
# Day N: [Topic]

*Date: YYYY-MM-DD*

## What I was trying to do

<!-- What was the goal for this session? What problem were you solving? -->

## What actually happened

<!-- What worked? What didn't? Were there surprises? -->

## What I learned

<!-- What's the one thing you'd explain to someone else now? -->

## What surprised me

<!-- Anything unexpected? Something that contradicted your assumptions? -->

## Questions for later

<!-- What are you still confused about? What do you want to explore next? -->
```

### Concept pages (`docs/src/concepts/`)

These are deep dives on technical topics. You CAN draft content here, but:
1. Always start by asking what the user already understands about the topic
2. Draft the content, but mark sections needing review with `<!-- REVIEW: [reason] -->`
3. Connect every concept page back to a specific part of parodyDB's implementation
4. Include a "How this shows up in parodyDB" section at the end
5. Prefer concrete examples over abstract explanations

### Reference pages (`docs/src/reference/`)

These are factual documentation of the codebase. You can write these more freely, but:
1. Always verify claims against the actual source code in `src/`
2. When the code changes, flag which reference pages need updating
3. Include runnable SQL examples where applicable

### Structural changes (SUMMARY.md, new sections)

When the user wants to add new pages or reorganize:
1. Propose the outline first — show the updated SUMMARY.md diff
2. Explain your reasoning for the organization
3. Do not create the files until the user approves the structure

## General rules

- Always ask "do you understand why X works this way?" before moving on
- When adding reference docs, connect them to journal entries: "you encountered this in session N"
- Prefer leaving gaps the user fills over generating complete content
- Cross-reference between sections: link journal entries to concepts, concepts to reference

## Cross-referencing

When writing or reviewing any page:
- If a concept page explains something a journal entry discovered, link between them
- If a reference page documents an API that a concept page explains, link between them
- Use relative links: `[inverted indexes](../concepts/inverted-indexes.md)`

## Technical notes

- mdBook config is in `book.toml`
- Source markdown lives in `docs/src/`
- Built output goes to `docs/book/` (gitignored)
- `mdbook serve` runs on port 3000 inside Docker, mapped to 6173 on host
- To add a new page: add it to SUMMARY.md, then create the .md file
  (or let `create-missing = true` generate a stub)
- Vercel deployment: set Root Directory to `docs` in project settings

## Quality checks

Before considering any documentation task complete:
- Does the user understand what was written? (Ask if unsure.)
- Are all code examples tested or marked as untested?
- Are cross-references in place?
- Is SUMMARY.md up to date?
