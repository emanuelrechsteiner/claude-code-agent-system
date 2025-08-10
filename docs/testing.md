## Testing

How to test locally:
- Verify agents list inside Claude Code with `/agents`.
- Exercise research flow after MCP setup with a prompt like: "Research React 19 features".

Quality checks:
- Shell scripts: run `shellcheck install.sh setup-firecrawl-mcp.sh uninstall.sh`.
- Markdown: run a Markdown linter (e.g., `markdownlint`) on `*.md`.

Coverage and gaps:
- No code unit tests; focus on manual verification of agent activation, ledger updates, and observation capture.

Next smoke tests:
- Ensure control-agent delegates on multi-step prompts.
- Confirm observation artifacts update when ledgers change.
- Validate Firecrawl calls succeed when key is present.


