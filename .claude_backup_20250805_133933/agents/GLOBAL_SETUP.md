# Global Claude Code Sub-Agents Setup

This directory contains globally available sub-agents that work across all your Claude Code projects. These agents implement an agentic workflow system with proper coordination, frequent commits, and systematic collaboration.

## 🌍 Global Agent Architecture

### Available Agents
- **control-agent**: SCRUM master and workflow orchestrator - coordinates all other agents
- **backend-agent**: Firebase and TypeScript backend specialist
- **frontend-agent**: React, TypeScript, and Tailwind CSS frontend specialist  
- **planning-agent**: Project planning and architecture specialist
- **research-agent**: Documentation and API research specialist using Firecrawl MCP
- **documentation-agent**: Comprehensive project documentation specialist
- **testing-agent**: Testing strategy and quality assurance specialist
- **version-control-agent**: Git and GitHub operations specialist

### Agent Coordination System
All agents follow a strict coordination protocol:
1. **MANDATORY REPORTING**: All agents report to control-agent before/during/after work
2. **FREQUENT COMMITS**: Maximum 60 minutes between commits
3. **SYSTEMATIC WORKFLOW**: Coordinated multi-agent development processes
4. **QUALITY GATES**: Built-in quality assurance and validation

## 📁 Implementation Locations

### User-Level (Global) - `~/.claude/agents/`
- Available across ALL projects
- Lower priority than project-specific agents
- Perfect for standardized workflows
- **RECOMMENDED** for these coordinated agents

### Project-Level - `.claude/agents/`
- Available only in specific project
- Higher priority than global agents
- Use for project-specific customizations
- Overrides global agents with same names

## 🚀 Usage Instructions

### Automatic Activation
The agents will automatically activate when Claude Code detects relevant tasks:
- **planning-agent**: When new app ideas are described
- **backend-agent**: For Firebase/API implementation tasks
- **frontend-agent**: For React/UI development
- **research-agent**: When new technologies are mentioned
- **documentation-agent**: After any major development step
- **testing-agent**: For testing and quality assurance
- **version-control-agent**: For git operations and releases

### Manual Activation
You can explicitly request specific agents:
```bash
> Use the control-agent to coordinate feature development
> Have the research-agent investigate GraphQL best practices
> Ask the testing-agent to create comprehensive test coverage
```

### Control-Agent Coordination
For complex multi-step tasks, start with the control-agent:
```bash
> Use the control-agent to orchestrate building a user authentication system
```

The control-agent will then coordinate the appropriate sequence of agents.

## 🔧 Customization Options

### Global Customization
Edit agents in `~/.claude/agents/` to modify behavior across all projects.

### Project-Specific Overrides
Create project-specific versions in `.claude/agents/` to override global behavior for specific projects.

### Team Sharing
Share these agent configurations with your team by:
1. Adding `~/.claude/agents/` to version control in a shared repository
2. Creating setup scripts to copy agents to team members' global directories
3. Using symlinks to shared agent configurations

## 📊 Agent Workflow Example

### Typical Feature Development Flow
```
1. User: "I want to add user profiles to my app"
2. control-agent: Orchestrates the workflow
3. planning-agent: Creates architecture and requirements
4. research-agent: Researches user profile best practices
5. backend-agent: Implements user profile APIs
6. frontend-agent: Builds profile UI components
7. testing-agent: Creates comprehensive tests
8. documentation-agent: Updates all documentation
9. version-control-agent: Manages commits and release
```

## 🔄 Maintenance

### Updating Agents
To update global agents:
1. Edit files in `~/.claude/agents/`
2. Changes apply to all new Claude Code sessions
3. Test changes on a single project first

### Backup Strategy
```bash
# Backup your global agents
cp -r ~/.claude/agents ~/claude-agents-backup-$(date +%Y%m%d)

# Restore from backup
cp -r ~/claude-agents-backup-YYYYMMDD/* ~/.claude/agents/
```

## 🌟 Benefits of Global Implementation

### Consistency
- Same high-quality workflows across all projects
- Standardized commit patterns and documentation
- Consistent code quality and testing standards

### Efficiency  
- No need to reconfigure agents for each project
- Immediate access to coordinated workflows
- Reduced setup time for new projects

### Collaboration
- Team members can share the same agent configurations
- Consistent development processes across the team
- Predictable workflow patterns for all projects

### Scalability
- Easy to update workflows across all projects simultaneously
- Centralized management of development processes
- Global improvements benefit all current and future projects

## 🎯 Quick Verification

Test your global setup:
```bash
# Start Claude Code in any project
claude

# Check available agents
/agents

# Verify your enhanced agents are listed
# Try a simple coordination test
> Use the control-agent to show me the current agent status
```

Your enhanced sub-agents are now available globally and will provide coordinated, efficient development workflows across all your projects!