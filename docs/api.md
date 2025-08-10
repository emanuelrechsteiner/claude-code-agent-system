## API

There are no network APIs (REST/GraphQL/RPC) provided by this repository.

Interfaces provided are file-based:
- Agents: Markdown specifications in `agents/*.md`
- Ledgers: JSON state machines in `ledgers/*.json`
- Observation: JSON and Markdown in `observation/`

External integrations:
- Firecrawl MCP (optional) for the Research Agent, configured via `firecrawl-api-key` in `.env`.

Rate limits: Governed by the external MCP provider (Firecrawl). No local API rate limiting.


