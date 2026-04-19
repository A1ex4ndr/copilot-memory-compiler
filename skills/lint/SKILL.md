---
name: lint
description: Run health checks on the knowledge base for broken links, orphans, contradictions, and staleness
---

## Purpose

Validate the integrity and quality of the knowledge base by running structural and semantic health checks.

## Health Checks

### 1. Broken Links (structural)
- Scan all markdown files for internal links (`[[concept-name]]` or relative paths)
- Report any links pointing to non-existent files

### 2. Orphan Articles (structural)
- Find concept articles not referenced by any other article or the index
- Report articles that may need to be linked or removed

### 3. Index Freshness (structural)
- Compare `index.md` last-compiled date against the most recent daily log
- Report if the index is out of date

### 4. Duplicate Concepts (structural)
- Detect concept articles that cover overlapping topics
- Suggest merging candidates

### 5. Contradictions (semantic)
- Compare related concept articles for conflicting statements
- Report potential contradictions with both versions

### 6. Staleness (semantic)
- Identify articles not updated in 30+ days that reference technologies or patterns that may have changed
- Suggest review

### 7. Unprocessed Logs (structural)
- Find daily logs missing the `<!-- compiled -->` marker
- Report logs that need compilation

## Output Format

```markdown
# Knowledge Base Health Report

Generated: YYYY-MM-DD HH:MM

## Summary
- ✅ Passed: N checks
- ⚠️ Warnings: N items
- ❌ Errors: N items

## Details

### Broken Links
- [file.md] → [[missing-reference]]

### Orphan Articles
- [concept-name.md] – not referenced anywhere

### Index Freshness
- Last compiled: YYYY-MM-DD
- Latest daily log: YYYY-MM-DD
- Status: ⚠️ Out of date

### Unprocessed Logs
- daily/YYYY-MM-DD.md
```

## Options

- **--structural-only**: Run only structural checks (no LLM calls needed, free)
- **--fix**: Automatically fix issues where possible (rebuild index, remove broken links)

## Rules

- Default to structural-only checks unless the user requests full analysis
- Never delete articles automatically; only suggest deletions
- Report results in a clear, actionable format
