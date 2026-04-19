---
name: query
description: Query the personal knowledge base using index-guided retrieval
---

## Purpose

Answer questions by consulting the knowledge base index and retrieving relevant articles. No RAG or vector database needed — at personal scale, an LLM reading a structured index outperforms vector similarity.

## Instructions

1. Read `memory/index.md` to understand what knowledge is available
2. Based on the user's question, identify relevant concept articles and Q&A entries
3. Read the identified articles from `memory/knowledge/concepts/` and `memory/knowledge/qa/`
4. Synthesize an answer from the retrieved knowledge
5. Cite sources (which concept articles and daily logs informed the answer)

## Query Process

```
User Question → Read index.md → Identify relevant articles → Read articles → Synthesize answer
```

## Response Format

```markdown
## Answer

[Synthesized answer to the question]

## Sources
- [concept-name.md](memory/knowledge/concepts/concept-name.md) – [relevant section]
- Daily log: [YYYY-MM-DD] – [relevant entry]
```

## Options

- **--file-back**: After answering, save the Q&A pair back into `memory/knowledge/qa/` for future reference
- **--deep**: Read all potentially related articles, not just the top matches from the index

## Rules

- Always start by reading the index; never guess about what's in the knowledge base
- If the knowledge base doesn't contain relevant information, say so clearly
- When using --file-back, format the saved Q&A entry with the question, answer, sources, and date
- Prefer recent knowledge over older entries when information conflicts
