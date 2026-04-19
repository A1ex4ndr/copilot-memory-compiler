---
name: flush
description: Extract key knowledge (decisions, lessons, patterns, gotchas) from the current session and append to today's daily log
---

## Purpose

Capture important knowledge from the current coding session before it ends or compacts.

## Instructions

1. Review the current session's conversation and actions
2. Identify extractable knowledge:
   - **Decisions** made and their rationale
   - **Lessons learned** from debugging or problem-solving
   - **Patterns** discovered or applied
   - **Gotchas** and pitfalls encountered
   - **Architecture** choices and trade-offs
3. Format each item as a structured entry
4. Append to `memory/daily/YYYY-MM-DD.md` (create if it doesn't exist)

## Daily Log Entry Format

```markdown
## [HH:MM] Session Entry

### Context
Brief description of what was being worked on.

### Extracted Knowledge

#### Decisions
- **Decision**: [what was decided]
  - **Rationale**: [why]
  - **Alternatives considered**: [what else was considered]

#### Lessons Learned
- [lesson description]

#### Patterns
- **Pattern**: [name]
  - **When to use**: [context]
  - **Implementation**: [brief description]

#### Gotchas
- [gotcha description and how to avoid it]
```

## Rules

- Only extract genuinely useful knowledge; skip trivial or obvious items
- Use today's date in UTC for the filename
- Create the `memory/daily/` directory if it doesn't exist
- Append to existing daily file; never overwrite
- If nothing meaningful was learned in the session, write a brief "No significant knowledge extracted" entry
