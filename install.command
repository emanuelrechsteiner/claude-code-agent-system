#!/bin/bash

# Claude Code Agent System - macOS Installation
# Double-click this file in Finder to install the system

set -e  # Exit on any error

# macOS-specific setup
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

# Change to the directory where this script is located
# This is crucial for double-click execution from Finder
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "📍 Changed to installer directory: $SCRIPT_DIR"

echo "🚀 Claude Code Agent System - macOS Installation"
echo "=================================================="
echo ""
echo "This installer will set up the complete Claude Code Agent System:"
echo "  • Agent templates and workflows"
echo "  • MCP server configuration (7 servers)"
echo "  • Global observation ledger"
echo "  • Vector database integration"
echo "  • Slash command templates (/start, /documentation, /ledger, /meta)"
echo ""

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to prompt user for input with default
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

# Function to pause and wait for user input
pause_for_user() {
    echo ""
    echo "Press any key to continue..."
    read -n 1 -s
    echo ""
}

# Function to show installation progress
show_progress() {
    local current=$1
    local total=$2
    local description="$3"
    
    local percent=$((current * 100 / total))
    local filled=$((percent / 5))
    local empty=$((20 - filled))
    
    printf "\r🔄 Progress: ["
    printf "%*s" $filled | tr ' ' '█'
    printf "%*s" $empty | tr ' ' '░'
    printf "] %d%% - %s" $percent "$description"
    
    if [ $current -eq $total ]; then
        echo ""
    fi
}

echo "🔍 Checking system requirements..."
echo ""

# Check macOS version
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ This installer is designed for macOS only."
    echo "For other systems, please use the regular install.sh script."
    pause_for_user
    exit 1
fi

echo "✅ Running on macOS $(sw_vers -productVersion)"

# Check if Claude Code is installed
if ! command_exists claude; then
    echo ""
    echo "❌ Claude Code CLI not found!"
    echo ""
    echo "Please install Claude Code first:"
    echo "  1. Go to: https://claude.ai/code"
    echo "  2. Download and install Claude Code"
    echo "  3. Run this installer again"
    echo ""
    echo "Press any key to open Claude Code website..."
    read -n 1 -s
    open "https://claude.ai/code"
    exit 1
fi

echo "✅ Claude Code CLI found"

# Check Node.js and npm
if ! command_exists node; then
    echo ""
    echo "❌ Node.js not found!"
    echo ""
    echo "Installing Node.js via Homebrew..."
    if command_exists brew; then
        brew install node
    else
        echo "Homebrew not found. Please install Node.js manually:"
        echo "  1. Go to: https://nodejs.org"
        echo "  2. Download and install Node.js LTS"
        echo "  3. Run this installer again"
        pause_for_user
        open "https://nodejs.org"
        exit 1
    fi
fi

echo "✅ Node.js $(node --version) found"

# Check Python 3
if ! command_exists python3; then
    echo ""
    echo "❌ Python 3 not found!"
    echo ""
    echo "Installing Python 3 via Homebrew..."
    if command_exists brew; then
        brew install python
    else
        echo "Please install Python 3 manually:"
        echo "  1. Go to: https://python.org"
        echo "  2. Download and install Python 3.8+"
        echo "  3. Run this installer again"
        pause_for_user
        open "https://python.org"
        exit 1
    fi
fi

echo "✅ Python $(python3 --version | cut -d' ' -f2) found"

# Check if the required files exist (validates this is the correct repository)
if [ ! -f "agents/control-agent.md" ]; then
    echo ""
    echo "❌ Error: Required installation files not found!"
    echo "Current directory: $(pwd)"
    echo ""
    echo "This appears to be an incomplete installation. Please:"
    echo "  1. Download the complete claude-code-agent-system repository"
    echo "  2. Ensure all files are extracted properly"  
    echo "  3. Double-click install.command from the main directory"
    echo ""
    pause_for_user
    exit 1
fi

echo "✅ Running from correct directory"
echo ""

# Begin installation
echo "🚀 Starting installation..."
echo ""

total_steps=8
current_step=0

# Step 1: Create directory structure
((current_step++))
show_progress $current_step $total_steps "Creating directory structure"

mkdir -p ~/.claude/agents
mkdir -p ~/.claude/templates/commands
mkdir -p ~/.claude/templates/bootstrap
mkdir -p ~/.claude/global-observation
mkdir -p ~/.claude/hooks

# Step 2: Copy agent files
((current_step++))
show_progress $current_step $total_steps "Installing agent templates"

cp -r agents/* ~/.claude/agents/
cp -r templates/* ~/.claude/templates/

# Step 3: Create global observation ledger
((current_step++))
show_progress $current_step $total_steps "Initializing observation ledger"

if [ ! -f ~/.claude/global-observation/observation-ledger.json ]; then
    cat > ~/.claude/global-observation/observation-ledger.json << 'EOF'
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
    
    # Update timestamp
    current_time=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    sed -i.bak "s/\"created_at\": \"\"/\"created_at\": \"$current_time\"/" ~/.claude/global-observation/observation-ledger.json
    sed -i.bak "s/\"last_updated\": \"\"/\"last_updated\": \"$current_time\"/" ~/.claude/global-observation/observation-ledger.json
    rm ~/.claude/global-observation/observation-ledger.json.bak
fi

# Step 4: Create token counter
((current_step++))
show_progress $current_step $total_steps "Setting up token tracking"

if [ ! -f ~/.claude/global-observation/token-counter.json ]; then
    cat > ~/.claude/global-observation/token-counter.json << 'EOF'
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
    current_time=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    sed -i.bak "s/\"current_period_start\": \"\"/\"current_period_start\": \"$current_time\"/" ~/.claude/global-observation/token-counter.json
    rm ~/.claude/global-observation/token-counter.json.bak
fi

# Step 5: Set up hooks
((current_step++))
show_progress $current_step $total_steps "Installing automation hooks"

# Create example hooks (non-destructive)
cat > ~/.claude/hooks/guard-unsafe.sh << 'EOF'
#!/bin/bash
# Guard against potentially unsafe operations
# This hook validates commands before execution

command="$1"

# Block dangerous operations
if [[ "$command" =~ rm.*-rf.*/ ]] || [[ "$command" =~ sudo.*rm ]] || [[ "$command" =~ format.*disk ]]; then
    echo "⚠️  Blocked potentially dangerous command: $command"
    echo "If you're sure you want to run this, please execute it manually."
    exit 1
fi

# Allow safe operations
exit 0
EOF

cat > ~/.claude/hooks/auto-format.sh << 'EOF'
#!/bin/bash
# Auto-format code before commits
# This hook ensures code quality standards

project_root="$1"

# Check if we're in a project directory
if [ ! -f "$project_root/package.json" ] && [ ! -f "$project_root/pyproject.toml" ]; then
    exit 0  # Not a project, skip formatting
fi

# Format JavaScript/TypeScript projects
if [ -f "$project_root/package.json" ]; then
    if command -v prettier >/dev/null 2>&1; then
        cd "$project_root"
        npx prettier --write . 2>/dev/null || true
    fi
fi

# Format Python projects
if [ -f "$project_root/pyproject.toml" ]; then
    if command -v ruff >/dev/null 2>&1; then
        cd "$project_root"
        python -m ruff format . 2>/dev/null || true
    fi
fi

exit 0
EOF

chmod +x ~/.claude/hooks/*.sh

# Step 6: Create settings.json with hooks
cat > ~/.claude/settings.json << 'EOF'
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
  }
}
EOF

# Step 7: Configure MCP servers
((current_step++))
show_progress $current_step $total_steps "Configuring MCP servers"

echo ""
echo ""
echo "🔧 MCP Server Configuration"
echo "=========================="
echo ""
echo "The system needs to configure 7 MCP servers for full functionality:"
echo "  • filesystem, github, memory, everything, puppeteer (automatic)"
echo "  • firecrawl (requires API key)"
echo "  • vector-db (requires database path)"
echo ""

configure_mcp=$(prompt_user "Configure MCP servers now?" "y")

if [[ "$configure_mcp" =~ ^[Yy]$ ]]; then
    echo ""
    echo "Running MCP server configuration..."
    ./setup-mcp-servers.sh
    echo "✅ MCP servers configured"
else
    echo "⏭️  MCP server configuration skipped"
    echo "You can configure them later by running: ./setup-mcp-servers.sh"
fi

# Step 8: Verify installation
((current_step++))
show_progress $current_step $total_steps "Verifying installation"

echo ""
echo ""

# Verify directories
if [ -d ~/.claude/agents ] && [ -d ~/.claude/templates ] && [ -d ~/.claude/global-observation ]; then
    echo "✅ Directory structure created successfully"
else
    echo "❌ Directory structure incomplete"
    exit 1
fi

# Verify key files
key_files=(
    "~/.claude/agents/control-agent.md"
    "~/.claude/agents/improvement-agent.md"
    "~/.claude/templates/commands/start.md"
    "~/.claude/templates/commands/documentation.md"
    "~/.claude/templates/commands/ledger.md"
    "~/.claude/templates/commands/meta.md"
    "~/.claude/global-observation/observation-ledger.json"
    "~/.claude/global-observation/token-counter.json"
    "~/.claude/settings.json"
)

all_files_exist=true
for file in "${key_files[@]}"; do
    expanded_file="${file/#\~/$HOME}"
    if [ ! -f "$expanded_file" ]; then
        echo "❌ Missing: $file"
        all_files_exist=false
    fi
done

if $all_files_exist; then
    echo "✅ All core files installed successfully"
else
    echo "❌ Some files are missing"
    exit 1
fi

echo ""
echo "🎉 Installation Complete!"
echo "========================"
echo ""
echo "📊 Installation Summary:"
echo "  ✅ Agent templates: $(ls -1 ~/.claude/agents/*.md | wc -l) files"
echo "  ✅ Command templates: $(ls -1 ~/.claude/templates/commands/*.md | wc -l) files"
echo "  ✅ Global observation system initialized"
echo "  ✅ Token tracking configured"
echo "  ✅ Automation hooks installed"
echo "  ✅ Settings configured"

# Count MCP servers
mcp_count=$(claude mcp list 2>/dev/null | grep -c "✓ Connected" || echo "0")
# Ensure mcp_count is a valid number (fix for multi-line error output)
if ! [[ "$mcp_count" =~ ^[0-9]+$ ]]; then
    mcp_count=0
fi
echo "  📡 MCP servers: $mcp_count connected"

echo ""
echo "🚀 Next Steps:"
echo "=============="
echo "1. Restart Claude Code to load the new configuration"
echo "2. Test the system with a command like:"
echo "   claude /start --quick"
echo "3. Try other commands:"
echo "   claude /documentation"
echo "   claude /ledger --check"
echo "   claude /meta --verify"
echo ""

if [ "$mcp_count" -lt 5 ]; then
    echo "⚠️  MCP Server Setup:"
    echo "   Some MCP servers aren't configured yet."
    echo "   Run: ./setup-mcp-servers.sh to complete setup"
    echo ""
fi

echo "📚 Documentation:"
echo "   • Agent coordination: ~/.claude/agents/"
echo "   • Command templates: ~/.claude/templates/commands/"
echo "   • Global observations: ~/.claude/global-observation/"
echo "   • System settings: ~/.claude/settings.json"
echo ""

echo "✅ Your Claude Code Agent System is ready!"
echo ""

# Keep terminal open for user to see results
echo "Press any key to close this installer..."
read -n 1 -s

exit 0