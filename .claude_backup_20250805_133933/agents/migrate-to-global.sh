#!/bin/bash

# Migration Script: Project Agents to Global Agents
# This script helps you migrate project-specific agents to global scope

set -e

echo "🌍 Claude Code Agent Migration Tool"
echo "=================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠️${NC} $1"
}

print_error() {
    echo -e "${RED}❌${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ️${NC} $1"
}

# Check if we're in a project directory
if [ ! -d ".claude/agents" ]; then
    print_error "No .claude/agents directory found in current project."
    print_info "This script should be run from a project root that has local agents."
    exit 1
fi

# Create global agents directory if it doesn't exist
GLOBAL_AGENTS_DIR="$HOME/.claude/agents"
if [ ! -d "$GLOBAL_AGENTS_DIR" ]; then
    print_info "Creating global agents directory: $GLOBAL_AGENTS_DIR"
    mkdir -p "$GLOBAL_AGENTS_DIR"
fi

# Function to backup existing global agents
backup_global_agents() {
    if [ "$(ls -A $GLOBAL_AGENTS_DIR 2>/dev/null)" ]; then
        BACKUP_DIR="$HOME/claude-agents-backup-$(date +%Y%m%d-%H%M%S)"
        print_warning "Backing up existing global agents to: $BACKUP_DIR"
        cp -r "$GLOBAL_AGENTS_DIR" "$BACKUP_DIR"
        print_status "Backup completed"
    fi
}

# Function to migrate agents
migrate_agents() {
    print_info "Migrating agents from .claude/agents to ~/.claude/agents"
    
    for agent_file in .claude/agents/*.md; do
        if [ -f "$agent_file" ]; then
            agent_name=$(basename "$agent_file")
            
            # Check if global agent already exists
            if [ -f "$GLOBAL_AGENTS_DIR/$agent_name" ]; then
                print_warning "Global agent $agent_name already exists"
                echo -n "Overwrite? (y/N): "
                read -r response
                if [[ "$response" =~ ^[Yy]$ ]]; then
                    cp "$agent_file" "$GLOBAL_AGENTS_DIR/"
                    print_status "Overwritten $agent_name"
                else
                    print_info "Skipped $agent_name"
                fi
            else
                cp "$agent_file" "$GLOBAL_AGENTS_DIR/"
                print_status "Migrated $agent_name"
            fi
        fi
    done
}

# Function to create project-specific exclusions
create_project_exclusions() {
    print_info "Creating .claude/agents/.gitignore to exclude local agents from version control"
    
    if [ ! -f ".claude/agents/.gitignore" ]; then
        cat > .claude/agents/.gitignore << EOF
# Exclude all agent files since they're now global
*.md

# Include project-specific overrides if needed
# Remove the line below and uncomment specific files to version control project-specific agents
!.gitignore

# Example: Include project-specific customizations
# !custom-project-agent.md
EOF
        print_status "Created .claude/agents/.gitignore"
    else
        print_warning ".claude/agents/.gitignore already exists"
    fi
}

# Function to clean up local agents (optional)
cleanup_local_agents() {
    echo ""
    print_warning "Do you want to remove local agent files? (They're now global)"
    echo "This will keep your .claude/agents directory but remove the .md files"
    echo -n "Remove local agents? (y/N): "
    read -r response
    
    if [[ "$response" =~ ^[Yy]$ ]]; then
        # Remove all .md files except README if it exists
        find .claude/agents -name "*.md" -not -name "README.md" -delete
        print_status "Removed local agent files"
        
        # Create a reminder file
        cat > .claude/agents/USE_GLOBAL_AGENTS.md << EOF
# Using Global Agents

The agents for this project are now configured globally at:
\`~/.claude/agents/\`

## Available Global Agents
- control-agent
- backend-agent  
- frontend-agent
- planning-agent
- research-agent
- documentation-agent
- testing-agent
- version-control-agent

## Project-Specific Customizations
If you need project-specific agent behavior:
1. Create agent files in this directory
2. They will override global agents with the same name
3. Update .gitignore to include them in version control

## Global Agent Management
To update global agents:
\`\`\`bash
cd ~/.claude/agents
# Edit agent files as needed
\`\`\`

Generated on: $(date)
EOF
        print_status "Created reminder file: .claude/agents/USE_GLOBAL_AGENTS.md"
    else
        print_info "Local agents kept (they will override global agents)"
    fi
}

# Function to verify global setup
verify_global_setup() {
    echo ""
    print_info "Verifying global agent setup..."
    
    EXPECTED_AGENTS=("control-agent.md" "backend-agent.md" "frontend-agent.md" "planning-agent.md" "research-agent.md" "documentation-agent.md" "testing-agent.md" "version-control-agent.md")
    
    missing_agents=()
    for agent in "${EXPECTED_AGENTS[@]}"; do
        if [ ! -f "$GLOBAL_AGENTS_DIR/$agent" ]; then
            missing_agents+=("$agent")
        fi
    done
    
    if [ ${#missing_agents[@]} -eq 0 ]; then
        print_status "All expected agents are present globally"
    else
        print_warning "Missing agents: ${missing_agents[*]}"
    fi
    
    # Count total agents
    agent_count=$(ls -1 "$GLOBAL_AGENTS_DIR"/*.md 2>/dev/null | wc -l)
    print_info "Total global agents: $agent_count"
}

# Function to show next steps
show_next_steps() {
    echo ""
    echo -e "${BLUE}🎯 Next Steps:${NC}"
    echo "1. Start a new Claude Code session: claude"
    echo "2. Check available agents: /agents"
    echo "3. Test coordination: 'Use the control-agent to show current status'"
    echo "4. Verify all your enhanced agents are listed and working"
    echo ""
    echo -e "${GREEN}✨ Your agents are now available globally across all projects!${NC}"
    echo ""
    echo "📁 Global agents location: $GLOBAL_AGENTS_DIR"
    echo "📋 Setup documentation: $GLOBAL_AGENTS_DIR/GLOBAL_SETUP.md"
}

# Main migration process
main() {
    echo "This script will:"
    echo "1. Backup existing global agents (if any)"
    echo "2. Copy project agents to global location"
    echo "3. Create .gitignore for local agents"
    echo "4. Optionally clean up local agents"
    echo "5. Verify the global setup"
    echo ""
    
    echo -n "Continue with migration? (y/N): "
    read -r response
    
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        print_info "Migration cancelled"
        exit 0
    fi
    
    echo ""
    backup_global_agents
    migrate_agents
    create_project_exclusions
    cleanup_local_agents
    verify_global_setup
    show_next_steps
}

# Run the migration
main "$@"