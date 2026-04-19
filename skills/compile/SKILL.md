---
name: compile
description: Compile daily session logs into structured, cross-referenced knowledge articles
---

## Purpose

Transform raw daily logs into organized concept articles with cross-references, making the knowledge base searchable and useful for future sessions.

## Instructions

1. Scan `memory/daily/` for unprocessed daily log files
2. For each unprocessed log, extract distinct concepts and knowledge items
3. For each concept:
   - Check if a concept article already exists in `memory/knowledge/concepts/`
   - If yes: update/merge new information into the existing article
   - If no: create a new concept article
4. Update cross-references in `memory/knowledge/connections/`
5. Generate Q&A entries in `memory/knowledge/qa/` for key learnings
6. Rebuild `memory/index.md`
7. Mark daily logs as processed (add `<!-- compiled -->` at the end)

## Concept Article Format

Create files in `memory/knowledge/concepts/` named with kebab-case: `concept-name.md`

```markdown
---
title: [Concept Name]
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: [list of daily log dates]
related: [list of related concept filenames]
tags: [relevant tags]
---

# [Concept Name]

## Summary
[2-3 sentence overview of this concept]

## Details
[Detailed explanation, patterns, and guidelines]

## Examples
[Code examples or scenarios where this applies]

## Gotchas
[Known pitfalls and how to avoid them]

## Related Concepts
- [[related-concept-1]]
- [[related-concept-2]]
```

## Connection Map Format

Create/update `memory/knowledge/connections/map.md`:

```markdown
# Knowledge Connections

## [Concept A]
- relates to → [Concept B] (reason)
- depends on → [Concept C] (reason)

## [Concept B]
- relates to → [Concept A] (reason)
```

## Index Format

Rebuild `memory/index.md`:

```markdown
# Knowledge Base Index

Last compiled: YYYY-MM-DD

## Concepts (N articles)
| Concept | Tags | Updated |
|---------|------|---------|
| [concept-name](knowledge/concepts/concept-name.md) | tag1, tag2 | YYYY-MM-DD |

## Recent Q&A (last 20)
| Question | Answer Location |
|----------|----------------|
| [question] | [file path] |
```

## Rules

- Merge related knowledge into single concept articles; avoid duplication
- Keep concept articles focused on one topic each
- Always update the index after compilation
- Preserve source attribution (which daily log contributed each piece of knowledge)
- If concepts contradict each other, note the contradiction and keep the most recent understanding
