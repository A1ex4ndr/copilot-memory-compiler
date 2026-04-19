# Copilot Memory Compiler Plugin

A GitHub Copilot CLI plugin that automatically captures coding sessions and compiles them into a searchable personal knowledge base. Inspired by [Karpathy's LLM Knowledge Base](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) architecture and adapted from [coleam00/claude-memory-compiler](https://github.com/coleam00/claude-memory-compiler).

## How It Works

```
Session Start → inject index.md into context
    ↓
Coding Session (decisions, patterns, lessons accumulate)
    ↓
Session End → hook marks daily log → flush skill extracts knowledge
    ↓
Daily logs accumulate → compile skill → structured knowledge articles
    ↓
Next Session Start → index.md injected → cycle repeats
```

## Install

```shell
copilot plugin install A1ex4ndr/copilot-memory-compiler
```

## Components

### Agent
- **memory-compiler** – Manages the full knowledge base lifecycle

### Skills
| Skill | Description |
|-------|-------------|
| **flush** | Extract knowledge from the current session into today's daily log |
| **compile** | Process daily logs into structured concept articles with cross-references |
| **query** | Ask questions answered by the knowledge base (index-guided, no RAG) |
| **lint** | Run health checks (broken links, orphans, contradictions, staleness) |

### Hooks
| Event | Action |
|-------|--------|
| `sessionStart` | Injects `memory/index.md` into session context |
| `sessionEnd` | Marks session in daily log, prompts for flush |

## Knowledge Base Structure

```
memory/
├── daily/                    # Raw daily logs (YYYY-MM-DD.md)
├── knowledge/
│   ├── concepts/             # Structured concept articles
│   ├── connections/map.md    # Cross-reference map
│   └── qa/                   # Q&A entries
└── index.md                  # Master index for retrieval
```

## Usage

After installation, the plugin works automatically:

1. **Automatic**: Hooks capture session boundaries. Use the `memory-compiler` agent or `flush` skill at session end to extract knowledge.
2. **Compile**: Run the `compile` skill (or let it auto-trigger after 6 PM UTC) to organize daily logs into articles.
3. **Query**: Use the `query` skill to ask questions: "What patterns have I used for error handling?"
4. **Lint**: Run the `lint` skill periodically to keep the knowledge base healthy.

## Why No RAG?

At personal scale (50–500 articles), an LLM reading a structured `index.md` outperforms vector similarity search. The LLM understands intent; cosine similarity just finds similar words. RAG becomes necessary only at ~2,000+ articles when the index exceeds the context window.

## Uninstall

```shell
copilot plugin uninstall copilot-memory-compiler
```
