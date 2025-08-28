# 🔧 Claude Code Agent System - Troubleshooting Guide

Comprehensive troubleshooting guide for resolving common issues with the Claude Code Agent System.

## 🚨 Quick Diagnosis

### System Health Check
```bash
# First, always run this command
claude /ledger --check

# Look for these indicators:
# 🟢 90%+ health = System is healthy
# 🟡 70-89% health = Minor issues, continue reading
# 🔴 <70% health = Critical issues, follow emergency procedures
```

### Emergency Reset
If the system is completely unresponsive:
```bash
# 1. Restart Claude Code
pkill -f "claude"
# Reopen Claude Code application

# 2. Re-run installation
./install-enhanced.sh

# 3. Reconfigure MCP servers
./setup-mcp-servers.sh
```

## 📋 Common Issues by Category

## 🚀 Installation Issues

### "Command not found: claude"

**Problem:** Claude Code CLI is not installed or not in PATH

**Diagnosis:**
```bash
which claude
# If nothing is returned, Claude Code is not installed
```

**Solutions:**
1. **Install Claude Code**
   - Visit: https://claude.ai/code
   - Download and install Claude Code
   - Restart terminal after installation

2. **Fix PATH Issues**
   ```bash
   # Add to ~/.zshrc or ~/.bashrc
   export PATH="/usr/local/bin:$PATH"
   export PATH="/opt/homebrew/bin:$PATH"  # macOS with Homebrew
   
   # Reload shell
   source ~/.zshrc
   ```

3. **Verify Installation**
   ```bash
   claude --version
   # Should show Claude Code version
   ```

### "Permission denied" Errors

**Problem:** Installation scripts don't have execute permissions

**Solutions:**
```bash
# Fix script permissions
chmod +x install-enhanced.sh
chmod +x setup-mcp-servers.sh
chmod +x install.command

# Fix hook permissions
chmod +x ~/.claude/hooks/*.sh

# Fix directory permissions
chmod 755 ~/.claude
chmod -R 755 ~/.claude/agents
chmod -R 755 ~/.claude/templates
```

### "Node.js not found"

**Problem:** Node.js required for MCP servers but not installed

**Solutions:**

**macOS:**
```bash
# Using Homebrew (recommended)
brew install node

# Using MacPorts
sudo port install nodejs18

# Manual download
# Visit: https://nodejs.org
```

**Windows:**
```bash
# Download from nodejs.org
# Or use Chocolatey
choco install nodejs

# Or use winget
winget install OpenJS.NodeJS
```

**Linux:**
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install nodejs npm

# CentOS/RHEL
sudo yum install nodejs npm

# Arch Linux
sudo pacman -S nodejs npm
```

**Verification:**
```bash
node --version  # Should show v16.0.0 or higher
npm --version   # Should show npm version
```

### "Python not found"

**Problem:** Python 3.8+ required for vector database but not installed

**Solutions:**

**macOS:**
```bash
# Using Homebrew (recommended)
brew install python

# Using system Python
xcode-select --install

# Manual download
# Visit: https://python.org
```

**Windows:**
```bash
# Download from python.org
# Or use Microsoft Store
# Or use Chocolatey
choco install python
```

**Linux:**
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install python3 python3-pip

# CentOS/RHEL
sudo yum install python3 python3-pip

# Arch Linux
sudo pacman -S python python-pip
```

**Verification:**
```bash
python3 --version  # Should show 3.8.0 or higher
pip3 --version     # Should show pip version
```

### Installation Fails Mid-Process

**Problem:** Installation script stops with errors

**Diagnosis Steps:**
```bash
# 1. Check disk space
df -h ~/.claude

# 2. Check permissions
ls -la ~/.claude

# 3. Check dependencies
claude --version
node --version
python3 --version

# 4. Run with verbose output
bash -x ./install-enhanced.sh
```

**Solutions:**
1. **Clean Previous Installation**
   ```bash
   # Remove partial installation
   rm -rf ~/.claude
   
   # Re-run installer
   ./install-enhanced.sh
   ```

2. **Manual Step-by-Step Installation**
   ```bash
   # Create directories manually
   mkdir -p ~/.claude/{agents,templates/commands,global-observation,hooks}
   
   # Copy files manually
   cp agents/*.md ~/.claude/agents/
   cp templates/commands/*.md ~/.claude/templates/commands/
   
   # Set permissions
   chmod -R 755 ~/.claude
   ```

## 🔌 MCP Server Issues

### "MCP server connection failed"

**Problem:** One or more MCP servers cannot connect

**Diagnosis:**
```bash
# Check server status
claude mcp list

# Look for servers marked with ❌ or "Failed to connect"
```

**Solutions by Server:**

#### Filesystem Server
```bash
# Remove and re-add
claude mcp remove filesystem -s user
claude mcp add filesystem -s user -- npx @modelcontextprotocol/server-filesystem "$HOME"
```

#### GitHub Server
```bash
# Remove and re-add
claude mcp remove github -s user
claude mcp add github -s user -- npx @modelcontextprotocol/server-github
```

#### Memory Server
```bash
# Remove and re-add
claude mcp remove memory -s user
claude mcp add memory -s user -- npx @modelcontextprotocol/server-memory
```

#### Firecrawl Server (requires API key)
```bash
# Check API key format (should start with 'fc-')
echo $FIRECRAWL_API_KEY

# Remove and re-add with correct key
claude mcp remove firecrawl -s user
claude mcp add firecrawl -s user -e "FIRECRAWL_API_KEY=fc-your-key-here" -- npx -y firecrawl-mcp
```

#### Vector Database Server
```bash
# Check database path exists
ls -la /path/to/your/vector/database

# Remove and re-add with correct path
claude mcp remove vector-db -s user
claude mcp add vector-db -s user -e "VECTOR_DB_PATH=/correct/path" -- python3 /path/to/mcp-vector-server.py
```

### "Firecrawl API key invalid"

**Problem:** Firecrawl server fails due to API key issues

**Diagnosis:**
```bash
# Check if API key is set
claude mcp get firecrawl

# API key should start with 'fc-'
```

**Solutions:**
1. **Get Valid API Key**
   - Visit: https://firecrawl.dev
   - Sign up for account
   - Get API key from dashboard

2. **Configure Correctly**
   ```bash
   # Re-run MCP setup
   ./setup-mcp-servers.sh
   
   # Or configure manually
   claude mcp remove firecrawl -s user
   claude mcp add firecrawl -s user -e "FIRECRAWL_API_KEY=fc-your-actual-key" -- npx -y firecrawl-mcp
   ```

### "Vector database not found"

**Problem:** Vector database server cannot locate the database

**Diagnosis:**
```bash
# Check common locations
ls -la /Volumes/*/VectorDatabase/
ls -la ~/VectorDatabase/
ls -la ~/Development/*/VectorDB*/
```

**Solutions:**
1. **Let Setup Script Find It**
   ```bash
   ./setup-mcp-servers.sh
   # Script will search common locations automatically
   ```

2. **Manual Configuration**
   ```bash
   # Find your vector database
   find /Volumes -name "*VectorDB*" -type d 2>/dev/null
   find ~ -name "*VectorDatabase*" -type d 2>/dev/null
   
   # Configure with correct path
   claude mcp add vector-db -s user -e "VECTOR_DB_PATH=/correct/path/to/vectordb" -- python3 /path/to/mcp-vector-server.py
   ```

3. **Create New Vector Database**
   ```bash
   # If you don't have one, you can skip this server
   # Or create a new one (implementation depends on your setup)
   ```

## 🤖 Agent Coordination Issues

### "Agents not responding"

**Problem:** Agents don't activate or respond to prompts

**Diagnosis:**
```bash
# 1. Check agent files exist
ls -la ~/.claude/agents/

# 2. Check settings configuration
cat ~/.claude/settings.json

# 3. Test system health
claude /ledger --check
```

**Solutions:**
1. **Verify Agent Installation**
   ```bash
   # Should see 10+ agent files
   ls -1 ~/.claude/agents/*.md | wc -l
   
   # Re-install if missing
   cp agents/*.md ~/.claude/agents/
   ```

2. **Check Agent File Format**
   ```bash
   # Each agent file should start with YAML frontmatter
   head -10 ~/.claude/agents/control-agent.md
   
   # Should show:
   # ---
   # name: "control-agent"
   # description: "..."
   # ---
   ```

3. **Test Individual Agent**
   ```bash
   claude "Use the control-agent to analyze this request"
   # Should see control-agent respond
   ```

### "Control-agent not delegating"

**Problem:** Control-agent does work directly instead of delegating

**Diagnosis:**
```bash
# Check if control-agent follows delegation patterns
claude "Build a simple React component"

# Should see:
# 1. Control-agent analyzes
# 2. Control-agent activates ui-agent
# 3. UI-agent does the work
```

**Solutions:**
1. **Re-install Control Agent**
   ```bash
   cp agents/control-agent.md ~/.claude/agents/
   ```

2. **Check CLAUDE.md Workflow**
   ```bash
   # Verify global workflow is installed
   ls -la ~/.claude/CLAUDE.md
   
   # Re-install if missing
   cp CLAUDE.md ~/.claude/
   ```

3. **Explicit Delegation Request**
   ```bash
   claude "Use the control-agent to coordinate building a React component. The control-agent must delegate to the ui-agent."
   ```

### "Multi-agent workflows failing"

**Problem:** Agents don't coordinate properly or fail mid-workflow

**Diagnosis:**
```bash
# Check system coordination health
claude /ledger --metrics

# Look for:
# - Agent coordination success rate
# - Workflow completion rate  
# - Error patterns
```

**Solutions:**
1. **Repair System Coordination**
   ```bash
   claude /ledger --repair
   ```

2. **Reset Agent State**
   ```bash
   # Restart Claude Code to clear agent state
   pkill -f "claude"
   # Reopen Claude Code
   ```

3. **Update Agent Protocols**
   ```bash
   cp agent-protocols.md ~/.claude/
   ```

## ⚡ Slash Command Issues

### "Slash command not found"

**Problem:** Commands like `/start`, `/documentation` don't work

**Diagnosis:**
```bash
# Check if command templates exist
ls -la ~/.claude/templates/commands/

# Should show:
# start.md
# documentation.md
# ledger.md
# meta.md
```

**Solutions:**
1. **Install System Ripgrep (CRITICAL FIX)**: The most common cause is using Claude Code's built-in ripgrep instead of system ripgrep
   ```bash
   # macOS
   brew install ripgrep
   
   # Ubuntu/Debian
   sudo apt install ripgrep
   
   # Add to shell profile (.zshrc, .bashrc, etc.)
   echo 'export USE_BUILTIN_RIPGREP=0' >> ~/.zshrc
   
   # Or add to ~/.claude/settings.json
   {
     "environment": {
       "USE_BUILTIN_RIPGREP": "0"
     }
   }
   
   # Verify system ripgrep is being used
   which rg  # Should show /usr/local/bin/rg or /opt/homebrew/bin/rg, NOT claude-code/vendor
   ```

2. **Re-install Command Templates**
   ```bash
   cp templates/commands/*.md ~/.claude/templates/commands/
   ```

3. **Check Claude Code Configuration**
   ```bash
   # Restart Claude Code after installing templates
   pkill -f "claude"
   # Reopen Claude Code
   ```

4. **Fix Bash Command Permissions**: If you get "permission check failed" errors for git commands, the slash commands need EXACT command permissions (not wildcards):
   ```bash
   # WRONG - Uses wildcards and compound commands with || operators:
   # allowed-tools: ["*", "Bash(git:*)", "Bash(git rev-parse:*)"]
   
   # CORRECT - Exact commands without shell operators:
   # allowed-tools: ["*", "Bash(git rev-parse --show-toplevel)", "Bash(git branch --show-current)"]
   
   # Claude Code is aware of shell operators like || && so compound commands fail
   # Remove || operators and use separate commands instead
   
   # Re-copy updated templates with correct permissions
   cp templates/commands/*.md ~/.claude/commands/
   ```

5. **Test Commands One by One**
   ```bash
   claude /start --quick
   claude /ledger --check
   claude /documentation --help
   claude /meta --verify
   ```

### "/start command fails"

**Problem:** `/start` command doesn't complete or fails with errors

**Common Error Messages:**
- "Insufficient codebase understanding"
- "Memory MCP server not available"
- "Research agent activation failed"

**Solutions:**
1. **Check Prerequisites**
   ```bash
   # Verify you're in a code repository
   pwd
   ls -la  # Should show code files
   
   # Check MCP servers
   claude mcp list
   # Memory server should be connected
   ```

2. **Start with Quick Mode**
   ```bash
   # Try quick exploration first
   claude /start --quick
   
   # Then try deep mode
   claude /start --deep
   ```

3. **Manual Research Agent Test**
   ```bash
   claude "Use the research-agent to analyze this project structure"
   ```

### "/documentation command fails"

**Problem:** `/documentation` doesn't generate docs or fails with errors

**Common Issues:**
- "No /start data available"
- "Confidence level too low"
- "Documentation agent not responding"

**Solutions:**
1. **Run /start First**
   ```bash
   # Documentation requires codebase understanding
   claude /start --deep
   
   # Wait for >90% confidence, then:
   claude /documentation
   ```

2. **Check File Permissions**
   ```bash
   # Ensure docs directory is writable
   mkdir -p docs
   chmod 755 docs
   ```

3. **Test Documentation Agent**
   ```bash
   claude "Use the documentation-agent to create a simple README"
   ```

### "/ledger command errors"

**Problem:** `/ledger` shows errors or unhealthy status

**Common Issues:**
- "Observation ledger corrupted"
- "Token counter missing"
- "System health critical"

**Solutions:**
1. **Repair Observation System**
   ```bash
   claude /ledger --repair
   ```

2. **Reset Observation Ledger**
   ```bash
   # Backup current ledger
   cp ~/.claude/global-observation/observation-ledger.json ~/ledger-backup.json
   
   # Re-initialize
   ./install-enhanced.sh
   ```

3. **Manual Ledger Reset**
   ```bash
   cat > ~/.claude/global-observation/observation-ledger.json << 'EOF'
   {
     "ledger_version": "1.0",
     "created_at": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
     "observations": [],
     "patterns": [],
     "improvements": []
   }
   EOF
   ```

## 🚀 Performance Issues

### "System is very slow"

**Problem:** Agent responses take much longer than expected

**Diagnosis:**
```bash
# Check system metrics
claude /ledger --metrics

# Look for:
# - High token usage
# - Low cache hit rates
# - Agent coordination delays
```

**Solutions:**
1. **Optimize Token Usage**
   ```bash
   # Check token consumption
   claude /ledger --metrics --verbose
   
   # Run meta-optimization
   claude /meta --enhance
   ```

2. **Clear System Cache**
   ```bash
   # Archive old observations
   claude /ledger --export --archive-old
   ```

3. **Restart System**
   ```bash
   # Complete restart
   pkill -f "claude"
   # Wait 10 seconds
   # Reopen Claude Code
   ```

### "High memory usage"

**Problem:** System uses too much memory or becomes unstable

**Solutions:**
1. **Clean Observation Data**
   ```bash
   # Archive old data
   claude /ledger --export --format json > observations-backup.json
   claude /ledger --repair --clean-old
   ```

2. **Optimize MCP Servers**
   ```bash
   # Restart MCP servers
   claude mcp list
   # Note any servers using high memory
   
   # Restart problematic servers
   claude mcp remove server-name -s user
   claude mcp add server-name -s user -- command
   ```

### "Token limit exceeded"

**Problem:** System hits token usage limits

**Diagnosis:**
```bash
# Check token usage
claude /ledger --metrics

# Should show:
# - Current token usage
# - Token limit (typically 100,000)
# - Usage trends
```

**Solutions:**
1. **Monitor Usage Patterns**
   ```bash
   # View detailed token metrics
   cat ~/.claude/global-observation/token-counter.json
   ```

2. **Optimize System Efficiency**
   ```bash
   # Run meta-optimization
   claude /meta --enhance
   
   # Should improve token efficiency
   ```

3. **Archive Old Data**
   ```bash
   # Reduce active observation data
   claude /ledger --export --archive-old
   ```

## 🔍 Diagnostic Commands

### System Information
```bash
# Complete system status
claude /ledger --check --verbose

# MCP server status  
claude mcp list

# Agent file verification
ls -la ~/.claude/agents/

# Command template verification
ls -la ~/.claude/templates/commands/

# Settings verification
cat ~/.claude/settings.json
```

### Health Metrics
```bash
# Performance metrics
claude /ledger --metrics

# Meta-system status
claude /meta --verify

# Token usage analysis
cat ~/.claude/global-observation/token-counter.json
```

### Log Analysis
```bash
# Claude Code logs (location varies by OS)
# macOS: ~/Library/Logs/claude-code/
# Linux: ~/.local/share/claude-code/logs/
# Windows: %APPDATA%/claude-code/logs/

# Search for errors
grep -r "ERROR" ~/Library/Logs/claude-code/ 2>/dev/null || echo "No log directory found"
```

## 🆘 Emergency Recovery Procedures

### Complete System Reset

**When to use:** System is completely broken and nothing else works

```bash
# 1. Backup current data
mkdir -p ~/claude-backup
cp -r ~/.claude ~/claude-backup/

# 2. Remove everything
rm -rf ~/.claude

# 3. Re-install from scratch
./install-enhanced.sh

# 4. Reconfigure MCP servers
./setup-mcp-servers.sh

# 5. Restore observation data if needed
cp ~/claude-backup/.claude/global-observation/observation-ledger.json ~/.claude/global-observation/ 2>/dev/null || true
```

### Partial Recovery

**For specific component failures:**

#### Agent System Only
```bash
# Re-install agents
cp agents/*.md ~/.claude/agents/
chmod 644 ~/.claude/agents/*.md
```

#### MCP Servers Only
```bash
# Remove all servers
claude mcp list | grep "Connected" | awk '{print $3}' | xargs -I {} claude mcp remove {} -s user

# Re-run setup
./setup-mcp-servers.sh
```

#### Slash Commands Only
```bash
# Re-install command templates
cp templates/commands/*.md ~/.claude/templates/commands/
chmod 644 ~/.claude/templates/commands/*.md

# Restart Claude Code
pkill -f "claude"
# Reopen Claude Code
```

## 🔄 Maintenance Procedures

### Daily Maintenance
```bash
# Quick health check
claude /ledger --check

# Should show 90%+ health score
```

### Weekly Maintenance
```bash
# Detailed metrics review
claude /ledger --metrics

# System optimization
claude /meta --verify

# MCP server check
claude mcp list
```

### Monthly Maintenance
```bash
# Archive old observations
claude /ledger --export --archive-old

# System optimization
claude /meta --enhance

# Update system if needed
./install-enhanced.sh
```

## 📞 Getting Additional Help

### Built-in Diagnostics
```bash
# Comprehensive system report
claude /ledger --check --verbose

# Meta-system analysis
claude /meta --report

# Manual agent test
claude "Use the control-agent to diagnose any system issues"
```

### Manual Inspection
```bash
# Check all key files exist
find ~/.claude -name "*.md" -o -name "*.json" | sort

# Verify file contents
head -5 ~/.claude/agents/control-agent.md
head -5 ~/.claude/templates/commands/start.md
```

### Community Support
- **GitHub Issues**: Report bugs and get community help
- **Documentation**: Check latest docs for updates
- **System Health**: Use built-in diagnostics first

---

## 🎯 Prevention Tips

1. **Regular Health Checks**: Run `/ledger --check` daily
2. **Monitor Token Usage**: Check `/ledger --metrics` weekly
3. **Keep System Updated**: Re-run installer when updated
4. **Backup Important Data**: Export observations regularly
5. **Gentle Usage**: Trust agent coordination, don't force workflows

**Remember:** The system is designed to be self-healing. Most issues can be resolved with `/ledger --repair` or `/meta --enhance`. If all else fails, the emergency reset procedure will restore full functionality.

The Claude Code Agent System learns from every interaction, including troubleshooting sessions. Each problem solved helps the system become more robust and reliable for future use.