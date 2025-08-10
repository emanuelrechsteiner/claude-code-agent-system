## Overview

Purpose: A global, documentation-first multi-agent system for Claude Code that enforces a mandatory agentic workflow, coordinates specialized agents, and accumulates cross-project learning.

Primary user journeys:
- Install system globally, verify agents, and enable Firecrawl MCP for research.
- Use agents across any project with automatic control-agent coordination and observation.
- Improve the system over time via ledgers and global observation.

High-level stack:
- Domain: Agent coordination, documentation, and observation
- Runtime: File-based configuration under `~/.claude/`
- Artifacts: Markdown specs, JSON ledgers, shell install scripts
- Integrations: Firecrawl MCP (optional) via `firecrawl-api-key`

Key scripts/ports:
- Install: `./install.sh`
- MCP setup: `./setup-firecrawl-mcp.sh`
- Uninstall: `./uninstall.sh`

System diagram:
```mermaid
graph TD
  U[Developer in Claude Code] -->|prompts| CA[Control Agent]
  CA -->|delegates| SA[Specialized Agents]
  SA -->|update| LEDGERS[Ledgers/*.json]
  SA -->|observe| OBS[Observation/ Activity & Patterns]
  IMP[Improvement Agent] -->|learns from| OBS
  IMP -->|updates| GLOBAL[Global Observation Ledger]
  RE[Research Agent] -->|MCP| FIRECRAWL[(Firecrawl)]

  subgraph Repo
    agents[agents/*.md]
    docs[docs/*]
    scripts[install.sh, setup-firecrawl-mcp.sh, uninstall.sh]
    ledgers[ledgers/*.json]
    observation[observation/*.md|*.json]
  end
```

Canonical docs:
- `docs/architecture.md`
- `docs/dev-setup.md`
- `docs/code-map.md`


