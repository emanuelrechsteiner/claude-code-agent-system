#!/bin/bash

# Claude Code Multi-Agent System Installation Script
# This script installs the agent system globally for Claude Code

set -e  # Exit on error

echo "🤖 Claude Code Multi-Agent System Installer"
echo "=========================================="
echo ""

# Check if Claude directory exists
if [ ! -d "$HOME/.claude" ]; then
    echo "Creating ~/.claude directory..."
    mkdir -p "$HOME/.claude"
fi

# Create necessary subdirectories
echo "📁 Creating directory structure..."
mkdir -p "$HOME/.claude/agents"
mkdir -p "$HOME/.claude/global-observation"
mkdir -p "$HOME/.claude/ledgers"
mkdir -p "$HOME/.claude/observation"
mkdir -p "$HOME/.claude/test-scenarios"

# Copy agent configurations
echo "🤖 Installing agents..."
cp agents/*.md "$HOME/.claude/agents/"
echo "  ✓ Installed $(ls -1 agents/*.md | wc -l) agents"

# Copy observation infrastructure
echo "🔍 Setting up observation infrastructure..."
cp -r observation/* "$HOME/.claude/observation/"
echo "  ✓ Observation system configured"

# Copy ledger templates
echo "📊 Setting up ledger system..."
cp -r ledgers/* "$HOME/.claude/ledgers/"
echo "  ✓ Ledger system initialized"

# Copy global configuration files
echo "⚙️  Installing global configuration..."
cp task-registry.json "$HOME/.claude/"
cp agent-protocols.md "$HOME/.claude/"

# Install mandatory global workflow
echo "🚨 Installing MANDATORY global workflow..."
cp CLAUDE.md "$HOME/.claude/"
cp memory.md "$HOME/.claude/"
echo "  ✓ Mandatory workflow installed"

# Install settings template with enforcement hooks
echo "🔒 Setting up workflow enforcement..."
if [ ! -f "$HOME/.claude/settings.json" ]; then
    echo "  Installing settings with enforcement hooks..."
    cp settings-template.json "$HOME/.claude/settings.json"
    echo "  ✓ New settings.json created with mandatory hooks"
else
    echo "  ⚠️  Existing settings.json found"
    echo "  You may need to manually add the hook configuration from settings-template.json"
    echo "  See WORKFLOW_ENFORCEMENT_VALIDATION.md for details"
fi

echo "  ✓ Global configuration installed"

# Initialize global observation ledger if it doesn't exist
if [ ! -f "$HOME/.claude/global-observation/observation-ledger.json" ]; then
    echo "📝 Initializing global observation ledger..."
    cp global-observation/observation-ledger.json "$HOME/.claude/global-observation/"
    echo "  ✓ Global ledger initialized"
else
    echo "📝 Global observation ledger already exists, skipping..."
fi

# Set permissions
echo "🔒 Setting permissions..."
chmod 755 "$HOME/.claude"
chmod 755 "$HOME/.claude/agents"
chmod 644 "$HOME/.claude/agents/"*.md
echo "  ✓ Permissions configured"

# Verification
echo ""
echo "✅ Installation Complete!"
echo ""
echo "📋 Verification:"
echo "  - Agents installed: $(ls -1 "$HOME/.claude/agents/"*.md | wc -l)"
echo "  - Observation system: $([ -d "$HOME/.claude/observation" ] && echo "Ready" || echo "Error")"
echo "  - Global ledger: $([ -f "$HOME/.claude/global-observation/observation-ledger.json" ] && echo "Ready" || echo "Error")"
echo "  - Task registry: $([ -f "$HOME/.claude/task-registry.json" ] && echo "Ready" || echo "Error")"
echo ""
echo "🚀 Your Claude Code Multi-Agent System is ready!"
echo "   🚨 MANDATORY WORKFLOW ENFORCEMENT IS NOW ACTIVE!"
echo "   The agentic workflow will apply to EVERY interaction automatically."
echo ""
echo "✨ New Features Installed:"
echo "   • Automatic workflow enforcement (cannot be bypassed)"
echo "   • Control-agent mandatory delegation"
echo "   • Hook-based prompt injection"
echo "   • Universal application across all projects"
echo ""
echo "💡 Next steps:"
echo "   1. Restart Claude Code if it's running"
echo "   2. Try ANY prompt - the workflow will activate automatically"
echo "   3. Watch as control-agent delegates to specialized agents"
echo "   4. See WORKFLOW_ENFORCEMENT_VALIDATION.md for testing guidelines"
echo ""