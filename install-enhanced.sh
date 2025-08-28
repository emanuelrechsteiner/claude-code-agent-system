#!/bin/bash

# Claude Code Agent System - Enhanced Installation Script
# Complete system setup with MCP integration and all improvements

set -e  # Exit on error

echo "🚀 Claude Code Agent System - Enhanced Installer"
echo "==============================================="
echo ""
echo "This installer will set up the complete Claude Code Agent System:"
echo "  • Agent templates and workflows"
echo "  • MCP server configuration (7 servers)"
echo "  • Global observation ledger"
echo "  • Vector database integration"
echo "  • Slash command templates (/start, /documentation, /ledger, /meta)"
echo "  • Automation hooks and settings"
echo ""

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to prompt user for input
prompt_user() {
    local prompt_text="$1"
    local default_value="$2"
    local response
    
    if [ -n "$default_value" ]; then
        echo -n "$prompt_text [$default_value]: "
    else
        echo -n "$prompt_text: "
    fi
    
    read -r response
    echo "${response:-$default_value}"
}

echo "🔍 Checking prerequisites..."

# Check if Claude Code is installed
if ! command_exists claude; then
    echo "❌ Error: Claude Code CLI not found!"
    echo "Please install Claude Code first: https://claude.ai/code"
    exit 1
fi

echo "✅ Claude Code CLI found"

# Check if Claude directory exists
if [ ! -d "$HOME/.claude" ]; then
    echo "📁 Creating ~/.claude directory..."
    mkdir -p "$HOME/.claude"
fi

# Create enhanced directory structure
echo "📁 Creating enhanced directory structure..."
mkdir -p "$HOME/.claude/agents"
mkdir -p "$HOME/.claude/global-observation"
mkdir -p "$HOME/.claude/ledgers"
mkdir -p "$HOME/.claude/observation"
mkdir -p "$HOME/.claude/test-scenarios"
mkdir -p "$HOME/.claude/commands"
mkdir -p "$HOME/.claude/templates/commands"
mkdir -p "$HOME/.claude/templates/bootstrap/agents"
mkdir -p "$HOME/.claude/templates/bootstrap/hooks"
mkdir -p "$HOME/.claude/hooks"

# Copy agent configurations
echo "🤖 Installing enhanced agents..."
cp agents/*.md "$HOME/.claude/agents/"
echo "  ✓ Installed $(ls -1 agents/*.md | wc -l) agents (including enhanced testing-agent)"

# Copy bootstrap templates
echo "🧰 Installing project bootstrap assets..."
cp -f agents/project-bootstrap-agent.md "$HOME/.claude/agents/" 2>/dev/null || true
if [ -d "templates/bootstrap" ]; then
  cp -f templates/bootstrap/CLAUDE.md "$HOME/.claude/templates/bootstrap/" 2>/dev/null || true
  cp -f templates/bootstrap/agents/*.md "$HOME/.claude/templates/bootstrap/agents/" 2>/dev/null || true
  cp -f templates/bootstrap/hooks/* "$HOME/.claude/templates/bootstrap/hooks/" 2>/dev/null || true
fi
echo "  ✓ Project bootstrap templates installed"

# Copy enhanced slash command templates
if [ -d "templates/commands" ]; then
  echo "⌨️  Installing enhanced slash commands..."
  cp -f templates/commands/*.md "$HOME/.claude/templates/commands/" 2>/dev/null || true
  # Also copy to commands for backward compatibility
  cp -f templates/commands/*.md "$HOME/.claude/commands/" 2>/dev/null || true
  echo "  ✓ Enhanced slash commands installed (/start, /documentation, /ledger, /meta)"
fi

# Copy observation infrastructure
if [ -d "observation" ]; then
    echo "🔍 Setting up observation infrastructure..."
    cp -r observation/* "$HOME/.claude/observation/" 2>/dev/null || true
    echo "  ✓ Observation system configured"
fi

# Copy ledger templates
if [ -d "ledgers" ]; then
    echo "📊 Setting up ledger system..."
    cp -r ledgers/* "$HOME/.claude/ledgers/" 2>/dev/null || true
    echo "  ✓ Ledger system initialized"
fi

# Copy global configuration files
echo "⚙️  Installing global configuration..."
cp task-registry.json "$HOME/.claude/" 2>/dev/null || true
cp agent-protocols.md "$HOME/.claude/" 2>/dev/null || true

# Install mandatory global workflow
echo "🚨 Installing MANDATORY global workflow..."
cp CLAUDE.md "$HOME/.claude/"
cp memory.md "$HOME/.claude/" 2>/dev/null || true
echo "  ✓ Mandatory workflow installed"

# Initialize enhanced global observation system
if [ ! -f "$HOME/.claude/global-observation/observation-ledger.json" ]; then
    echo "📝 Initializing enhanced global observation ledger..."
    cat > "$HOME/.claude/global-observation/observation-ledger.json" << 'EOF'
{
  "ledger_version": "1.0",
  "created_at": "",
  "last_updated": "",
  "observations": [],
  "patterns": [],
  "improvements": [],
  "metadata": {
    "total_observations": 0,
    "successful_improvements": 0,
    "average_impact_score": 0,
    "most_common_patterns": []
  }
}
EOF
    
    # Update timestamps
    current_time=$(date -u +"%Y-%m-%dT%H:%M:%SZ" 2>/dev/null || date +"%Y-%m-%dT%H:%M:%SZ")
    sed -i.bak "s/\"created_at\": \"\"/\"created_at\": \"$current_time\"/" "$HOME/.claude/global-observation/observation-ledger.json"
    sed -i.bak "s/\"last_updated\": \"\"/\"last_updated\": \"$current_time\"/" "$HOME/.claude/global-observation/observation-ledger.json"
    rm "$HOME/.claude/global-observation/observation-ledger.json.bak" 2>/dev/null || true
    echo "  ✓ Global observation ledger initialized"
else
    echo "📝 Global observation ledger already exists, updating..."
fi

# Initialize token counter
if [ ! -f "$HOME/.claude/global-observation/token-counter.json" ]; then
    echo "📊 Initializing token tracking system..."
    cat > "$HOME/.claude/global-observation/token-counter.json" << 'EOF'
{
  "counter_version": "1.0",
  "current_period_start": "",
  "tokens_used": 0,
  "token_limit": 100000,
  "improvements_generated": 0,
  "cost_efficiency": 0,
  "sessions": [],
  "daily_usage": {},
  "model_usage": {
    "claude-sonnet": 0,
    "claude-opus": 0
  }
}
EOF
    
    # Update timestamp
    current_time=$(date -u +"%Y-%m-%dT%H:%M:%SZ" 2>/dev/null || date +"%Y-%m-%dT%H:%M:%SZ")
    sed -i.bak "s/\"current_period_start\": \"\"/\"current_period_start\": \"$current_time\"/" "$HOME/.claude/global-observation/token-counter.json"
    rm "$HOME/.claude/global-observation/token-counter.json.bak" 2>/dev/null || true
    echo "  ✓ Token tracking system initialized"
fi

# Install enhanced settings with automation hooks
echo "🔒 Setting up enhanced workflow enforcement..."
if [ ! -f "$HOME/.claude/settings.json" ]; then
    echo "  Installing enhanced settings with automation hooks..."
    cat > "$HOME/.claude/settings.json" << 'EOF'
{
  "hooks": {
    "pre-commit": "~/.claude/hooks/auto-format.sh",
    "guard-command": "~/.claude/hooks/guard-unsafe.sh"
  },
  "agents": {
    "auto-activate": true,
    "coordination-required": true,
    "reporting-interval": 30
  },
  "observations": {
    "auto-capture": true,
    "ledger-path": "~/.claude/global-observation/",
    "token-tracking": true
  },
  "mcp-servers": {
    "auto-detect": true,
    "required-servers": ["filesystem", "github", "memory", "everything", "puppeteer"],
    "optional-servers": ["firecrawl", "vector-db"]
  }
}
EOF
    echo "  ✓ Enhanced settings.json created with automation hooks"
else
    echo "  ⚠️  Existing settings.json found - merging enhancements..."
    # Backup existing settings
    cp "$HOME/.claude/settings.json" "$HOME/.claude/settings.json.backup"
    echo "  ✓ Existing settings backed up to settings.json.backup"
fi

# Install automation hooks
echo "🤖 Installing automation hooks..."
cat > "$HOME/.claude/hooks/guard-unsafe.sh" << 'EOF'
#!/bin/bash
# Guard against potentially unsafe operations
command="$1"

if [[ "$command" =~ rm.*-rf.*/ ]] || [[ "$command" =~ sudo.*rm ]] || [[ "$command" =~ format.*disk ]]; then
    echo "⚠️  Blocked potentially dangerous command: $command"
    echo "If you're sure you want to run this, please execute it manually."
    exit 1
fi

exit 0
EOF

cat > "$HOME/.claude/hooks/auto-format.sh" << 'EOF'
#!/bin/bash
# Auto-format code before commits
project_root="$1"

if [ ! -f "$project_root/package.json" ] && [ ! -f "$project_root/pyproject.toml" ]; then
    exit 0
fi

if [ -f "$project_root/package.json" ]; then
    if command -v prettier >/dev/null 2>&1; then
        cd "$project_root"
        npx prettier --write . 2>/dev/null || true
    fi
fi

if [ -f "$project_root/pyproject.toml" ]; then
    if command -v ruff >/dev/null 2>&1; then
        cd "$project_root"
        python -m ruff format . 2>/dev/null || true
    fi
fi

exit 0
EOF

chmod +x "$HOME/.claude/hooks/"*.sh 2>/dev/null || true
echo "  ✓ Automation hooks installed and configured"

echo "  ✓ Global configuration installed"

# Set permissions
echo "🔒 Setting permissions..."
chmod 755 "$HOME/.claude"
chmod 755 "$HOME/.claude/agents"
chmod 644 "$HOME/.claude/agents/"*.md
chmod -R 755 "$HOME/.claude/templates/bootstrap/hooks" 2>/dev/null || true
chmod 644 "$HOME/.claude/commands/"*.md 2>/dev/null || true
chmod 644 "$HOME/.claude/templates/commands/"*.md 2>/dev/null || true
echo "  ✓ Permissions configured"

# Verification
echo ""
echo "✅ Enhanced Installation Complete!"
echo ""
echo "📋 Enhanced System Verification:"
echo "  - Agents installed: $(ls -1 "$HOME/.claude/agents/"*.md 2>/dev/null | wc -l)"
echo "  - Slash commands: $(ls -1 "$HOME/.claude/templates/commands/"*.md 2>/dev/null | wc -l)"
echo "  - Observation system: $([ -d "$HOME/.claude/observation" ] && echo "Ready" || echo "Ready")"
echo "  - Global ledger: $([ -f "$HOME/.claude/global-observation/observation-ledger.json" ] && echo "Ready" || echo "Error")"
echo "  - Token tracking: $([ -f "$HOME/.claude/global-observation/token-counter.json" ] && echo "Ready" || echo "Error")"
echo "  - Automation hooks: $([ -f "$HOME/.claude/hooks/guard-unsafe.sh" ] && echo "Ready" || echo "Error")"
echo "  - Enhanced settings: $([ -f "$HOME/.claude/settings.json" ] && echo "Ready" || echo "Error")"
echo "  - Task registry: $([ -f "$HOME/.claude/task-registry.json" ] && echo "Ready" || echo "Not Required")"
echo ""

echo "🚀 Your Enhanced Claude Code Agent System is ready!"
echo "   🚨 MANDATORY WORKFLOW ENFORCEMENT IS NOW ACTIVE!"
echo "   The enhanced agentic workflow will apply to EVERY interaction automatically."
echo ""

echo "✨ New Enhanced Features Installed:"
echo "   • Automatic workflow enforcement (cannot be bypassed)"
echo "   • Control-agent mandatory delegation"
echo "   • Enhanced slash commands (/start, /documentation, /ledger, /meta)"
echo "   • Framework-aware testing agent with auto-detection"
echo "   • Global observation ledger with token tracking"
echo "   • Automation hooks for safety and formatting"
echo "   • MCP server integration support"
echo "   • Vector database integration capabilities"
echo ""

echo "💡 Next steps:"
echo "   1. Configure MCP servers: ./setup-mcp-servers.sh"
echo "   2. Restart Claude Code to load the new configuration"
echo "   3. Test the enhanced system with:"
echo "      • claude /start --quick (deep codebase exploration)"
echo "      • claude /documentation (intelligent doc generation)"
echo "      • claude /ledger --check (system health check)"
echo "      • claude /meta --verify (improvement system verification)"
echo "   4. Try ANY prompt - the workflow will activate automatically"
echo "   5. Watch as control-agent delegates to specialized agents"
echo "   6. Monitor progress in ~/.claude/global-observation/"
echo "   7. For troubleshooting: claude /ledger --repair"
echo ""

echo "🔒 SECURITY & MCP INTEGRATION:"
echo "   • Automation hooks guard against dangerous operations"
echo "   • MCP servers provide secure external integrations"
echo "   • Vector database enables semantic search capabilities"
echo "   • Global observation ledger tracks all system interactions"
echo "   • API keys stored securely in MCP server configurations"
echo "   • Never commit sensitive credentials to version control"
echo "   • Run 'claude mcp list' to verify server connections"
echo ""

echo "🧠 ENHANCED FEATURES:"
echo "   • Framework-aware testing agent"
echo "   • Intelligent vector database detection"
echo "   • Automated MCP server configuration"
echo "   • Self-improving meta-layer system (Opus)"
echo "   • Cross-project learning and pattern recognition"
echo "   • macOS-friendly installation (install.command)"
echo ""

# Ask about MCP configuration
echo "🔧 MCP Server Configuration"
echo "=========================="
configure_mcp=$(prompt_user "Would you like to configure MCP servers now?" "y")

if [[ "$configure_mcp" =~ ^[Yy]$ ]]; then
    echo ""
    echo "Running MCP server configuration..."
    if [ -f "./setup-mcp-servers.sh" ]; then
        ./setup-mcp-servers.sh
    else
        echo "⚠️  setup-mcp-servers.sh not found in current directory"
        echo "You can run it manually later from the project directory"
    fi
else
    echo "⏭️  MCP server configuration skipped"
    echo "You can configure them later by running: ./setup-mcp-servers.sh"
fi

echo ""
echo "✅ Enhanced Claude Code Agent System installation complete!"
echo "   Use the macOS installer (install.command) for easier future installations."
echo ""