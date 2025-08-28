# 🚀 Claude Code Agent System

A comprehensive multi-agent development automation system that enhances Claude Code with specialized agents, intelligent workflows, and self-improving capabilities.

## 🤝 A Community-Driven Experimental Framework

**Hello, fellow AI enthusiasts!** 👋

This project started as a personal exploration into what's possible with Claude Code. As a hobbyist developer and AI enthusiast, I've been fascinated by the potential of agentic workflows and wanted to push the boundaries of what Claude Code can do. What began as simple experiments with workflows and sub-agents has evolved into this experimental framework.

**I'm not a professional developer** – I'm someone who loves coding as a hobby and is passionate about AI, particularly Claude Code. This repository represents my journey of discovery, experimentation, and lots of trial and error.

### Why I'm Sharing This

The framework is far from perfect. Many ideas are still experimental:
- The improvement agent needs refinement
- The strict agentic workflow with sub-agents requires repeated prompting to work consistently
- There are rough edges and plenty of room for optimization

**That's where you come in!** 🌟

I'm opening this project to the community because I believe in the power of collective creativity. Whether you're a seasoned developer, another hobbyist like me, or someone just starting their AI journey – your ideas, improvements, and contributions are welcome.

### Join the Experiment

This is **not** a polished product – it's a playground for ideas. If you:
- Love experimenting with AI and Claude Code
- Have ideas for improving agentic workflows
- Want to contribute to an open, collaborative project
- Enjoy tinkering and problem-solving

Then this project is for you! Let's build something amazing together, learn from each other, and push the boundaries of what's possible with Claude Code.

**Every contribution matters**, whether it's fixing a bug, improving documentation, suggesting new agent behaviors, or completely reimagining how the system works. There are no bad ideas in experimentation!

---

## ⚡ Quick Install

### macOS Users (Easiest)
**Double-click** `install.command` in Finder → Follow the wizard → Done!

### All Platforms
```bash
git clone <this-repository>
cd claude-code-agent-system
./install-enhanced.sh
```

## 📚 Complete Documentation

- **[📖 Installation Guide](INSTALLATION-GUIDE.md)** - Complete setup instructions for all platforms
- **[👤 User Guide](USER-GUIDE.md)** - How to use slash commands and agent workflows
- **[🔧 Troubleshooting](TROUBLESHOOTING.md)** - Solutions for common issues
- **[🎯 Quick Reference](#quick-reference)** - Essential commands and tips

## ✨ What You Get

### 🤖 10+ Specialized Agents
- **Control Agent** - Orchestrates all workflows
- **Research Agent** - Deep technical research with web access
- **Frontend/Backend Agents** - React, TypeScript, API development
- **Testing Agent** - Auto-detects frameworks (Vitest, Jest, Playwright)
- **Documentation Agent** - Generates comprehensive docs
- **Planning, UX, Version Control** - Complete development lifecycle

### ⚡ Powerful Slash Commands
- **`/start`** - Deep codebase exploration (>95% understanding)
- **`/documentation`** - Generate docs from codebase analysis
- **`/ledger`** - System health monitoring & improvement metrics
- **`/meta`** - Self-improvement system (uses Opus for meta-analysis)

### 🔌 Smart Integrations
- **7 MCP Servers** - External tool integrations
- **Vector Database** - Semantic search across your docs
- **Global Learning** - Improves across all projects
- **Automation Hooks** - Safety guards and auto-formatting

## 🎯 How It Works

```bash
# 1. Install once, use everywhere
./install-enhanced.sh

# 2. Analyze your codebase
claude /start --deep

# 3. Generate comprehensive docs
claude /documentation

# 4. Monitor & optimize
claude /ledger --metrics
```

**Every interaction teaches the system.** Agents coordinate automatically, learn your patterns, and get smarter with each project.

## 📋 Prerequisites

- **Claude Code CLI** - [Download here](https://claude.ai/code)
- **Node.js 16+** - For MCP servers
- **Python 3.8+** - For vector database

**Optional (enhances functionality):**
- Firecrawl API key for web research
- Vector database for semantic search

## 🎯 Installation Methods

### Method 1: macOS Double-Click (Easiest)
1. Download this repository
2. Double-click `install.command` in Finder
3. Follow the installation wizard
4. Restart Claude Code

### Method 2: Enhanced Command Line
```bash
git clone <repository-url>
cd claude-code-agent-system
chmod +x install-enhanced.sh
./install-enhanced.sh
```

### Method 3: Original Installer (Backward Compatible)
```bash
chmod +x install.sh
./install.sh
./setup-mcp-servers.sh  # Configure MCP servers
```

**Detailed Instructions:** See [📖 Installation Guide](INSTALLATION-GUIDE.md)

## ✅ Verify Installation

```bash
# Check system health
claude /ledger --check
# Should show: 🎯 Overall Health: 95%+ (🟢 Excellent)

# Test codebase analysis
claude /start --quick

# Check MCP servers
claude mcp list
# Should show 5-7 connected servers
```

## 🎮 Quick Reference

### Essential Commands
```bash
# System health & diagnostics
claude /ledger --check          # System health check
claude /ledger --metrics        # Performance metrics
claude /ledger --repair         # Fix system issues

# Codebase analysis & documentation
claude /start --quick           # Quick codebase analysis
claude /start --deep            # Deep exploration (recommended)
claude /documentation           # Generate comprehensive docs

# System optimization
claude /meta --verify           # Verify improvement system
claude /meta --enhance          # Activate optimizations

# MCP server management
claude mcp list                 # Check server connections
./setup-mcp-servers.sh          # Configure all servers
```

### Agent Coordination Examples
```bash
# Building features (agents coordinate automatically)
claude "Build a user authentication system"
claude "Create a dashboard with analytics"
claude "Add a search feature with filters"

# Code review & optimization
claude "Review and optimize this React component"
claude "Improve the performance of this API"
claude "Add comprehensive tests for this module"
```

## 🏗️ System Features

### 🤖 Intelligent Agent Coordination
- **Control Agent** orchestrates all workflows
- **Specialized Agents** handle specific domains (React, APIs, testing)
- **Quality Gates** ensure high standards
- **Automatic Delegation** - Control agent never works directly

### 🧠 Self-Improving System
- **Global Learning** across all projects
- **Pattern Recognition** identifies successful workflows
- **Meta-Layer Intelligence** (Opus) improves the system itself
- **Cross-Project Knowledge** transfer

### 🔌 Advanced Integrations
- **MCP Servers** for external tool access
- **Vector Database** for semantic search
- **Firecrawl** for web research
- **GitHub Integration** for repository operations
- **Browser Automation** with Puppeteer

### ⚡ Enhanced Development
- **Framework Detection** - Auto-configures for your stack
- **Test Automation** - Supports Vitest, Jest, Playwright, Cypress
- **Documentation Generation** - Creates comprehensive docs from code
- **Safety Hooks** - Prevents dangerous operations
- **Auto-formatting** - Code quality enforcement

## 💡 Usage Examples

### Building a New Feature
```bash
claude "I want to build a task management system with user auth"

# What happens automatically:
# 1. Control-agent analyzes requirements
# 2. Planning-agent creates architecture
# 3. Research-agent finds best practices
# 4. Backend-agent implements APIs
# 5. Frontend-agent builds UI components
# 6. Testing-agent ensures quality
# 7. Documentation-agent updates docs
```

### Code Analysis & Improvement
```bash
# Deep codebase exploration
claude /start --deep

# Generate comprehensive documentation
claude /documentation

# System optimization
claude /meta --enhance
```

### Troubleshooting
```bash
# System health check
claude /ledger --check

# If issues found:
claude /ledger --repair

# For detailed diagnostics:
claude /ledger --metrics --verbose
```

## ⚙️ Configuration & Customization

### MCP Server Setup
The system uses 7 MCP servers for enhanced functionality:

**Automatic Setup (5 servers):**
- filesystem, github, memory, everything, puppeteer

**Manual Configuration:**
```bash
# Run the setup wizard
./setup-mcp-servers.sh

# Configure Firecrawl (web research)
# Get API key from https://firecrawl.dev

# Configure Vector Database (semantic search)
# Script will auto-detect existing databases
```

### Customizing Agents
Edit agent files in `~/.claude/agents/` to customize behavior:
```bash
# Example: Modify the testing agent
vim ~/.claude/agents/testing-agent.md

# Each agent has:
# - YAML frontmatter (name, tools, model)
# - Role description and capabilities
# - Specific workflows and standards
```

### Automation Hooks
Custom hooks in `~/.claude/hooks/`:
- `auto-format.sh` - Code formatting before commits
- `guard-unsafe.sh` - Prevents dangerous operations

## 📊 System Monitoring

### Health Metrics
```bash
# Daily health check
claude /ledger --check

# Performance analysis
claude /ledger --metrics

# System optimization
claude /meta --enhance
```

### Key Metrics Tracked
- **System Health Score** (target: >90%)
- **Agent Coordination Success** (target: >95%)
- **Token Efficiency** (improvements per 1000 tokens)
- **Cross-Project Learning** (knowledge transfer rate)
- **Implementation Success** (observations → improvements)

## 🔒 Security & Privacy

- **Local Data Storage** - Everything in `~/.claude/`
- **No External Transmission** - Data stays on your machine
- **API Key Security** - Secure MCP server configuration
- **Safety Hooks** - Prevent dangerous operations
- **User Control** - Approve all system changes

## 🆘 Need Help?

### Built-in Diagnostics
```bash
claude /ledger --check --verbose    # Comprehensive health report
claude /meta --report               # Meta-system analysis
claude /ledger --repair             # Fix common issues
```

### Documentation
- **[📖 Installation Guide](INSTALLATION-GUIDE.md)** - Complete setup
- **[👤 User Guide](USER-GUIDE.md)** - How to use everything
- **[🔧 Troubleshooting](TROUBLESHOOTING.md)** - Fix common problems

### Common Issues
- **Agents not responding?** → `claude /ledger --repair`
- **MCP servers failing?** → `./setup-mcp-servers.sh`
- **Slow performance?** → `claude /meta --enhance`
- **Token limit hit?** → `claude /ledger --metrics`

## 🤝 Contributing & Community

**Your contributions are what make this experimental framework truly exciting!** 🚀

Whether you're fixing bugs, proposing new features, improving documentation, or sharing wild ideas – all contributions are welcome:

- **🐛 Found a bug?** Open an issue! Even small bugs teach us something.
- **💡 Have an idea?** Start a discussion or draft a proposal.
- **🔧 Want to fix something?** Submit a pull request – no contribution is too small.
- **📚 Improve docs?** Documentation improvements are always appreciated.
- **🧪 Experiment with agents?** Share your experiments and learnings.

### Getting Started with Contributing

1. Fork the repository
2. Try the installation: `./install-enhanced.sh`
3. Experiment with the agents
4. Share your discoveries, improvements, or questions

**No expertise required** – curiosity and enthusiasm are the most important qualities!

## 📝 License & Acknowledgments

MIT License - See LICENSE file for details

**Built for [Claude Code](https://claude.ai/code) by Anthropic**

### 🙏 Acknowledgments

- **Huge thanks to [Anthropic](https://anthropic.com)** for creating [Claude Code](https://claude.ai/code) – this amazing tool makes these experiments possible
- **Inspired by the incredible AI community** and everyone pushing the boundaries of what's possible
- **Special appreciation for all contributors** – this framework grows stronger with every idea, bug report, and improvement
- **Gratitude to fellow hobbyists and enthusiasts** who believe in learning through experimentation

This project exists because of the amazing tools and community around AI development. Thank you for being part of this journey! 🌟

---

## 🚀 Get Started Now!

### macOS Users
**Double-click** `install.command` → Follow wizard → Done!

### All Other Platforms  
```bash
git clone <this-repository>
cd claude-code-agent-system
./install-enhanced.sh
```

**Then:**
```bash
claude /start --deep        # Analyze your codebase
claude /documentation       # Generate comprehensive docs
claude /ledger --check      # Verify system health
```

**Welcome to intelligent development automation!** 🎉

The system learns from every interaction and gets smarter with each project. Start simple, let agents coordinate, and watch your development workflow transform.