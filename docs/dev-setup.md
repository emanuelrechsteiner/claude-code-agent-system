## Developer Setup

Prerequisites:
- macOS/Linux shell
- Claude Code installed
- Git

Environment:
- Copy `.env` from `example.env` and set `firecrawl-api-key` (optional, for Research Agent MCP):
  - `cp example.env .env`
  - Obtain key from `https://firecrawl.dev` (format `fc-...`).

Install:
```bash
./install.sh
```

Optional: Configure Firecrawl MCP for Research Agent
```bash
./setup-firecrawl-mcp.sh
```

Verification (inside Claude Code):
```text
/agents
```
You should see 12 agents available.

Common commands:
- Start (global availability): open any project in Claude Code; the system activates automatically.
- Uninstall/reset: `./uninstall.sh` then `./install.sh`.

Lint/format/build:
- Not applicable (documentation-first repo). Optionally run `shellcheck` for scripts and a Markdown linter.

Test commands:
- No automated tests. See `docs/testing.md` for suggested smoke checks.

Env reference (redacted):
- `firecrawl-api-key=fc-****` consumed by Research Agent MCP setup.


