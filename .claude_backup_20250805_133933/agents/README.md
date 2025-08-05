# Sub-Agents System for React TypeScript Firebase Template

This directory contains 8 specialized sub-agents that work together to build applications using your React TypeScript Firebase template. Each agent has specific expertise and responsibilities, following the template's strict rules and workflows.

## 🎯 Agent Overview

### 1. Control Agent (`control-agent.md`)
**Role**: Scrum Master & Orchestrator
- Manages all agent coordination and synchronization
- Enforces template rules and quality gates
- Manages workflow progression through the 7-step process
- Has exclusive permission to create/modify agent rules
- Must approve all agent actions

### 2. Planning Agent (`planning-agent.md`)
**Role**: Project Planning Specialist
- Creates comprehensive project documentation
- Sets up `docs/01_project_brief.md`, `docs/02_architecture.md`, and `docs/03_backlog.md`
- Follows Lean Canvas methodology
- Breaks down work into atomic tasks
- Plans technical architecture following template patterns

### 3. Research Agent (`research-agent.md`)
**Role**: Documentation Research Specialist
- Uses Firecrawl MCP to research external documentation
- Works parallel to Planning Agent
- Scrapes and summarizes relevant docs
- Provides implementation guides to other agents
- Keeps documentation current

### 4. Backend Agent (`backend-agent.md`)
**Role**: Firebase & TypeScript Backend Specialist
- Implements Firebase Auth, Firestore, and Functions
- Creates comprehensive type definitions
- Implements security rules and validation
- Follows template's Firebase patterns strictly
- Handles all backend implementation

### 5. Frontend Agent (`frontend-agent.md`)
**Role**: React, TypeScript & Tailwind Specialist
- Builds responsive, accessible UI components
- Implements Zustand state management
- Creates Storybook stories for all components
- Follows React 19 and Tailwind patterns
- Handles all frontend implementation

### 6. Documentation Agent (`documentation-agent.md`)
**Role**: Documentation Maintenance Specialist
- Maintains living documentation throughout development
- Documents all progress and decisions
- Creates developer onboarding guides
- Works with Version Control Agent for history tracking
- Ensures knowledge preservation

### 7. Version Control Agent (`version-control-agent.md`)
**Role**: Git & GitHub Specialist
- Manages all git operations and GitHub workflows
- Coordinates commits, branches, and pull requests
- Ensures multi-agent synchronization
- Enforces conventional commits
- **MANDATORY** communication point for all code changes

### 8. Testing Agent (`testing-agent.md`)
**Role**: Quality Assurance Specialist
- Implements comprehensive testing (Unit, E2E, Visual)
- Maintains 90%+ test coverage
- Reports errors to appropriate agents
- Only fixes test files, not application code
- Ensures quality gates pass

## 🔄 Workflow Integration

### Multi-Agent Coordination
The agents follow the template's 7-step workflow:

1. **Planning & Research Phase**
   - Planning Agent creates project documentation
   - Research Agent gathers external resources
   - Control Agent coordinates both agents

2. **Implementation Phase**
   - Backend Agent implements Firebase backend
   - Frontend Agent builds React components
   - Testing Agent writes comprehensive tests
   - Documentation Agent captures progress

3. **Integration Phase**
   - Version Control Agent manages commits
   - Testing Agent validates quality
   - Documentation Agent updates guides
   - Control Agent ensures compliance

### Communication Protocol
- **ALL agents must report to Control Agent before taking action**
- Version Control Agent is mandatory for any code changes
- Testing Agent reports errors to responsible agents
- Documentation Agent captures all decisions and changes

## 🚀 Usage Examples

### Starting a New Project
```bash
# User describes their app idea
"I want to build a task management app with team collaboration"

# System activates:
# 1. Control Agent coordinates the process
# 2. Planning Agent creates project documentation
# 3. Research Agent researches task management patterns
# 4. Other agents wait for approval to proceed
```

### During Development
```bash
# Backend Agent implements authentication
# 1. Reports to Control Agent for approval
# 2. Coordinates with Version Control Agent for commits
# 3. Testing Agent writes auth tests
# 4. Documentation Agent updates API docs
```

### Error Handling
```bash
# Testing Agent finds component error
# 1. Identifies Frontend Agent owns the failing component
# 2. Creates detailed error report
# 3. Frontend Agent fixes the issue
# 4. Version Control Agent manages the fix commit
```

## 🎯 Key Features

### Template Compliance
- **Documentation-First**: No coding without complete docs
- **Type-Safety**: All code fully typed
- **Test-Driven**: 90%+ coverage required
- **Security**: Comprehensive Firebase security rules
- **Quality Gates**: All checks must pass

### Agent Specialization
- Each agent has specific tools and permissions
- Focused expertise areas prevent conflicts
- Clear communication protocols
- Coordinated workflow execution

### Firecrawl Integration
- Research Agent uses advanced web scraping
- Automated documentation gathering
- Real-time research during development
- Efficient knowledge extraction

## 📋 Agent Tools

### Control Agent
- Read, Write, MultiEdit, Bash, TodoWrite, ExitPlanMode

### Planning Agent
- Read, Write, MultiEdit, Grep, Glob, TodoWrite

### Research Agent
- All Firecrawl MCP tools, Read, Write, MultiEdit

### Backend Agent
- Read, Write, MultiEdit, Edit, Bash, Grep, Glob, TodoWrite

### Frontend Agent
- Read, Write, MultiEdit, Edit, Bash, Grep, Glob, TodoWrite

### Documentation Agent
- Read, Write, MultiEdit, Edit, Grep, Glob, TodoWrite

### Version Control Agent
- Bash, Read, Write, Grep, Glob, TodoWrite

### Testing Agent
- Read, Write, MultiEdit, Edit, Bash, Grep, Glob

## 🔧 Setup Instructions

The sub-agents are already configured and ready to use. They will automatically activate based on your requests and the context of your work.

### Automatic Activation
- Planning Agent activates when you describe a new app idea
- Research Agent activates when new technologies are mentioned
- Implementation agents activate based on code changes
- Testing Agent runs continuously during development

### Manual Invocation
You can explicitly request specific agents:
```bash
"Use the planning-agent to help me plan a social media app"
"Have the research-agent find documentation for Firebase Auth"
"Ask the testing-agent to review test coverage"
```

## 📚 Next Steps

1. **Start Planning**: Describe your app idea to activate the Planning Agent
2. **Follow the Workflow**: Let the Control Agent guide the process
3. **Trust the System**: Each agent is an expert in their domain
4. **Monitor Progress**: Documentation Agent will track everything

The agents are designed to work seamlessly together, following your template's proven patterns and maintaining the highest quality standards. They will guide you through the complete development process from idea to deployment.