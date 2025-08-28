# 🚀 Claude Code Agent System - Installation Guide

A comprehensive guide to installing and setting up the Claude Code Agent System with all its enhanced features.

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Installation Methods](#installation-methods)
- [Post-Installation Setup](#post-installation-setup)
- [Verification](#verification)
- [Troubleshooting](#troubleshooting)
- [Getting Started](#getting-started)

## 🔧 Prerequisites

### Required Software

1. **Claude Code CLI** (Latest Version)
   ```bash
   # Check if installed
   claude --version
   
   # If not installed, get it from:
   # https://claude.ai/code
   ```

2. **Node.js 16+** (for MCP servers)
   ```bash
   # Check version
   node --version
   npm --version
   
   # Install if needed:
   # macOS: brew install node
   # Windows: Download from nodejs.org
   # Linux: Use package manager
   ```

3. **Python 3.8+** (for vector database)
   ```bash
   # Check version
   python3 --version
   
   # Install if needed:
   # macOS: brew install python
   # Windows: Download from python.org
   # Linux: Use package manager
   ```

### Optional but Recommended

4. **Git** (for version control features)
   ```bash
   git --version
   ```

5. **Firecrawl API Key** (for web research capabilities)
   - Sign up at [firecrawl.dev](https://firecrawl.dev)
   - Get your API key (format: `fc-xxxxxxxxx`)

## 🎯 Installation Methods

Choose the method that best fits your comfort level and operating system.

### Method 1: macOS Double-Click Installer (Easiest)

**Best for:** macOS users who prefer GUI installation

1. **Download the Repository**
   - Download as ZIP from GitHub
   - Or clone: `git clone <repository-url>`

2. **Run the Installer**
   - Open Finder and navigate to the downloaded folder
   - Double-click `install.command`
   - Follow the guided installation process

3. **What the Installer Does**
   - ✅ Checks all prerequisites automatically
   - ✅ Installs agent templates to `~/.claude/agents/`
   - ✅ Sets up slash command templates
   - ✅ Initializes global observation system
   - ✅ Configures automation hooks
   - ✅ Optionally configures MCP servers
   - ✅ Verifies installation success

### Method 2: Enhanced Command Line Installer

**Best for:** All platforms, technical users

```bash
# 1. Clone the repository
git clone <repository-url>
cd claude-code-agent-system

# 2. Make scripts executable
chmod +x install-enhanced.sh
chmod +x setup-mcp-servers.sh

# 3. Run the enhanced installer
./install-enhanced.sh

# 4. Follow prompts for MCP configuration
```

**What this installs:**
- Complete agent system
- Enhanced slash commands (/start, /documentation, /ledger, /meta)
- Global observation ledger with token tracking
- Automation hooks for safety and formatting
- MCP server integration support

### Method 3: Step-by-Step Manual Installation

**Best for:** Users who want full control

```bash
# 1. Create directory structure
mkdir -p ~/.claude/{agents,templates/commands,global-observation,hooks}

# 2. Copy agent templates
cp agents/*.md ~/.claude/agents/

# 3. Copy slash command templates
cp templates/commands/*.md ~/.claude/templates/commands/

# 4. Initialize observation system
cat > ~/.claude/global-observation/observation-ledger.json << 'EOF'
{
  "ledger_version": "1.0",
  "created_at": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "last_updated": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "observations": [],
  "patterns": [],
  "improvements": [],
  "metadata": {
    "total_observations": 0,
    "successful_improvements": 0,
    "average_impact_score": 0
  }
}
EOF

# 5. Set up configuration
cp CLAUDE.md ~/.claude/
cp settings-template.json ~/.claude/settings.json

# 6. Configure MCP servers
./setup-mcp-servers.sh
```

## ⚙️ Post-Installation Setup

### 1. Restart Claude Code

**Important:** Restart Claude Code completely to load the new configuration.

```bash
# Kill any running Claude Code processes
pkill -f "claude"

# Restart Claude Code
# (Re-open the application)
```

### 2. Verify MCP Server Connections

```bash
# Check server status
claude mcp list

# Should show something like:
# ✓ Connected: filesystem
# ✓ Connected: github  
# ✓ Connected: memory
# ✓ Connected: everything
# ✓ Connected: puppeteer
# ✓ Connected: firecrawl (if configured)
# ✓ Connected: vector-db (if configured)
```

### 3. Test Basic Functionality

```bash
# Test system health
claude /ledger --check

# Quick codebase exploration
claude /start --quick

# Test agent coordination
claude "List all available agents"
```

## 🔌 MCP Server Configuration

The system uses 7 MCP servers for enhanced functionality:

### Automatic Configuration (5 servers)
These are configured automatically during installation:
- **filesystem** - File system access
- **github** - GitHub integration
- **memory** - Knowledge graph memory
- **everything** - Testing/demo server
- **puppeteer** - Browser automation

### Manual Configuration Required

#### Firecrawl (Web Research)
```bash
# Get API key from https://firecrawl.dev
./setup-mcp-servers.sh

# Or configure manually:
claude mcp add firecrawl -s user -e "FIRECRAWL_API_KEY=fc-your-key-here" -- npx -y firecrawl-mcp
```

#### Vector Database (Semantic Search)
```bash
# The installer will help detect existing databases
./setup-mcp-servers.sh

# Or configure manually with your database path:
claude mcp add vector-db -s user -e "VECTOR_DB_PATH=/path/to/your/vectordb" -- python3 /path/to/mcp-vector-server.py
```

## ✅ Verification

### 1. Directory Structure Check
```bash
# Verify all directories exist
ls -la ~/.claude/
# Should show: agents/ templates/ global-observation/ hooks/ settings.json

# Check agent count
ls -1 ~/.claude/agents/*.md | wc -l
# Should show: 10+ (depending on installation)

# Check slash commands
ls -1 ~/.claude/templates/commands/*.md
# Should show: start.md documentation.md ledger.md meta.md
```

### 2. System Health Check
```bash
# Comprehensive system check
claude /ledger --check

# Should report:
# ✅ Overall Health Score: 95%+
# ✅ All core components operational
# ✅ MCP servers connected
# ✅ Observation system ready
```

### 3. Agent Functionality Test
```bash
# Test agent coordination
claude "I want to create a simple React component"

# Should see:
# 1. Control-agent analyzes request
# 2. Planning-agent creates plan
# 3. UI-agent implements component
# 4. Testing-agent adds tests
# 5. Documentation-agent updates docs
```

### 4. Slash Command Tests
```bash
# Test each slash command
claude /start --quick        # Codebase exploration
claude /documentation       # Doc generation  
claude /ledger --metrics     # System metrics
claude /meta --verify        # Meta-system check
```

## 🔧 Troubleshooting

### Common Installation Issues

#### "Command not found: claude"
```bash
# Claude Code not installed or not in PATH
# Solution: Install Claude Code from https://claude.ai/code
# Verify installation: which claude
```

#### "Permission denied" errors
```bash
# Fix script permissions
chmod +x install-enhanced.sh
chmod +x setup-mcp-servers.sh
chmod +x install.command

# Fix hook permissions  
chmod +x ~/.claude/hooks/*.sh
```

#### "Node.js not found"
```bash
# Install Node.js
# macOS: brew install node
# Windows: Download from nodejs.org
# Linux: Use package manager (apt install nodejs npm)
```

#### "Python not found"
```bash
# Install Python 3.8+
# macOS: brew install python
# Windows: Download from python.org  
# Linux: apt install python3 python3-pip
```

### MCP Server Issues

#### Server Connection Failures
```bash
# Check server status
claude mcp list

# Remove and reconfigure failed servers
claude mcp remove server-name -s user
./setup-mcp-servers.sh
```

#### Firecrawl API Key Issues
```bash
# Verify API key format (should start with 'fc-')
# Re-run MCP setup with correct key
./setup-mcp-servers.sh
```

#### Vector Database Not Found
```bash
# Run the setup script - it will help locate your database
./setup-mcp-servers.sh

# The script searches common locations:
# /Volumes/*/VectorDatabase/*
# ~/VectorDatabase/*
# ~/Development/*/VectorDB*
```

### System Performance Issues

#### Slow Response Times
```bash
# Check system health and optimize
claude /ledger --check
claude /meta --enhance

# Monitor token usage
claude /ledger --metrics
```

#### High Memory Usage
```bash
# Clear observation cache
claude /ledger --repair

# Restart Claude Code
pkill -f claude
# Reopen Claude Code
```

### Agent Coordination Issues

#### Agents Not Responding
```bash
# Verify agent files exist
ls -la ~/.claude/agents/

# Check settings configuration
cat ~/.claude/settings.json

# Test individual agent
claude "Use the control-agent to analyze this request"
```

#### Missing Slash Commands
```bash
# Verify command templates exist
ls -la ~/.claude/templates/commands/

# Re-run installation
./install-enhanced.sh
```

## 🚀 Getting Started

### Your First Tasks

1. **Explore Your Codebase**
   ```bash
   claude /start --deep
   ```
   - Analyzes your entire codebase
   - Achieves >95% understanding
   - Creates knowledge base for other commands

2. **Generate Documentation**
   ```bash
   claude /documentation
   ```
   - Uses codebase knowledge from /start
   - Creates comprehensive docs
   - Generates architecture diagrams

3. **Monitor System Health**
   ```bash
   claude /ledger --metrics
   ```
   - Shows system performance
   - Tracks improvements over time
   - Identifies optimization opportunities

4. **Try Agent Coordination**
   ```bash
   claude "Help me build a user authentication system"
   ```
   - Watch agents work together
   - See specialized expertise in action
   - Experience the full workflow

### Learning the System

1. **Start Simple**: Use basic prompts and watch agent coordination
2. **Try Slash Commands**: Explore the four main commands (/start, /documentation, /ledger, /meta)
3. **Monitor Progress**: Check `~/.claude/global-observation/` for learning data
4. **Experiment**: The system learns from every interaction

### Advanced Usage

1. **Custom Workflows**: Create project-specific agent configurations
2. **Hook Customization**: Modify automation hooks for your needs
3. **Vector Integration**: Set up semantic search for enhanced research
4. **Cross-Project Learning**: Work on multiple projects to see pattern recognition

## 📚 Next Steps

- **Read the User Guide**: Detailed usage instructions
- **Join the Community**: Share experiences and improvements
- **Contribute**: Help improve the system
- **Stay Updated**: Watch for new features and agents

---

**Welcome to the Claude Code Agent System!** 🎉

You now have a powerful multi-agent development automation system that learns from every interaction and gets smarter with each project. Start with simple tasks and watch as the system becomes an indispensable part of your development workflow.

For support, check the troubleshooting section above or refer to the comprehensive documentation in the repository.