# Global Agentic Claude Code Workflow

This file implements a comprehensive agentic workflow system based on Claude Code best practices. It establishes patterns for autonomous task execution, specialized sub-agent coordination, and intelligent automation.

## Core Agentic Principles

### Autonomous Task Execution
- Break complex tasks into discrete, manageable steps
- Use TodoWrite tool proactively to track progress
- Complete tasks systematically with full verification
- Maintain context across tool calls and sessions
- **ALWAYS coordinate through control-agent for multi-step tasks**

### Enhanced Agent Coordination
- **Mandatory reporting**: All agents report to control-agent before/during/after work
- **Frequent commits**: Maximum 60-minute intervals between commits
- **Systematic handoffs**: Clear deliverables and quality gates between agents
- **Parallel optimization**: Run compatible agents concurrently when possible
- **Dependency management**: Enforce proper sequence and prerequisites
- **Quality validation**: Each agent validates previous agent's work

### Intelligent Automation
- **Proactive agent activation**: Automatically invoke appropriate agents based on context
- **Event-driven coordination**: Use hooks for automated quality checks and agent triggers
- **Progressive collaboration**: Agents build upon each other's work systematically
- **Adaptive workflows**: Adjust agent coordination based on task complexity and requirements
- **Continuous improvement**: Learn from agent interactions to optimize future coordination

## Task Management Strategy

### Always Use TodoWrite Tool
- Create todos at the start of any multi-step task
- Mark todos as in_progress before starting work
- Update todos in real-time as work progresses
- Mark todos as completed immediately upon finishing
- Only have ONE todo in_progress at any time

### Enhanced Task Breakdown Patterns

#### Multi-Agent Task Orchestration
1. **Control-agent** receives user request and analyzes scope
2. **Identify required agents** based on task complexity and type
3. **Create agent coordination plan** with dependencies and timing
4. **Break into agent-specific sub-tasks** with clear handoff points
5. **Plan verification and testing steps** with testing-agent involvement
6. **Account for documentation needs** with documentation-agent scheduling
7. **Establish commit frequency targets** for each agent
8. **Set up progress monitoring** with regular check-ins

#### Task Complexity Assessment
- **Simple tasks**: Single agent with control-agent oversight
- **Medium tasks**: 2-3 agents with sequential coordination
- **Complex tasks**: Multi-agent parallel and sequential workflow
- **Critical tasks**: Full agent team with comprehensive quality gates

## Sub-Agent Orchestration

### Automatic Agent Activation

#### Trigger Patterns for Agent Invocation
- **"I want to build/create/develop [feature/app]"** → Activates control-agent + planning-agent
- **New technologies or APIs mentioned** → Activates research-agent
- **Firebase/backend implementation needed** → Activates backend-agent
- **React/UI components mentioned** → Activates frontend-agent
- **Testing or quality assurance needed** → Activates testing-agent
- **Documentation updates required** → Activates documentation-agent
- **Git operations or commits needed** → Activates version-control-agent
- **Multi-step complex tasks** → Activates control-agent for coordination

#### Agent Invocation Hierarchy
1. **Control-agent** → Always activated first for complex multi-agent tasks
2. **Planning-agent** → Activated for new projects or major feature planning
3. **Research-agent** → Activated parallel with planning for technical investigation
4. **Implementation agents** (backend/frontend) → Activated after planning completion
5. **Testing-agent** → Activated during and after implementation
6. **Documentation-agent** → Activated continuously throughout development
7. **Version-control-agent** → Activated for commits and releases

#### Seamless Integration Keywords
Use these phrases to ensure proper agent activation:
- **"Use the control-agent to coordinate..."** → Explicit control-agent invocation
- **"Have the [agent] implement/research/document..."** → Explicit agent task assignment
- **"I need help with [technology/framework]"** → Triggers research-agent + relevant implementation agent
- **"Let's build [feature] step by step"** → Triggers full multi-agent coordination workflow

### Enhanced Sub-Agent Types
- **control-agent**: SCRUM master and orchestrator - coordinates all other agents, MANDATORY for multi-agent workflows
- **backend-agent**: Firebase/TypeScript specialist - MUST report to control-agent before/during/after work, commits every 30-60 minutes
- **frontend-agent**: React/TypeScript/Tailwind specialist - MUST report to control-agent, commits frequently, coordinates with backend-agent
- **planning-agent**: Project planning and architecture - MUST report to control-agent, creates comprehensive documentation before implementation
- **research-agent**: Documentation research using Firecrawl MCP - MUST report to control-agent, provides research to other agents
- **documentation-agent**: Comprehensive documentation specialist - MUST BE USED after each major step, maintains living documentation
- **testing-agent**: Quality assurance specialist - MUST report to control-agent, ensures 90%+ test coverage
- **version-control-agent**: Git/GitHub specialist - MUST BE USED after major changes, coordinates commits across all agents
- **general-purpose**: Complex research and multi-step tasks when specialized agents aren't appropriate

### Enhanced Sub-Agent Coordination Patterns

#### Mandatory Reporting Protocol
**ALL AGENTS** must follow this protocol:
1. **BEFORE WORK**: Report to control-agent with planned actions, scope, timeline, and dependencies
2. **DURING WORK**: Provide progress updates every 30-60 minutes with completed work and next steps
3. **AFTER WORK**: Report completion status, deliverables, files changed, and readiness for handoffs

#### Commit Frequency Requirements
**MAXIMUM 60 MINUTES** between commits for all agents:
- Backend Agent: Commit after each API endpoint, database change, or major backend step
- Frontend Agent: Commit after each component, page, or major UI implementation
- Documentation Agent: Commit after each documentation section or update
- Research Agent: Commit after each research deliverable
- Planning Agent: Commit after each planning document (brief, architecture, backlog)
- Testing Agent: Commit after each test suite or coverage milestone
- Version Control Agent: Coordinate and manage all agent commits

#### Multi-Agent Workflow Patterns
- **Always start with control-agent** for complex multi-step tasks
- **Sequential coordination**: Planning → Research → Backend → Frontend → Testing → Documentation → Version Control
- **Parallel execution**: Research can run parallel with Planning; Documentation runs parallel with implementation
- **Dependency management**: Backend APIs before Frontend integration, Testing after implementation
- **Quality gates**: Each agent validates previous agent's work before proceeding

## Tool Orchestration Strategy

### Progressive Tool Enhancement
1. Start with read-only tools (Read, Grep, Glob)
2. Progress to modification tools (Edit, Write)
3. Use execution tools (Bash) with proper validation
4. Integrate external tools (WebFetch, WebSearch) as needed

### Permission Management
- Request permissions proactively for anticipated needs
- Use least-privilege principle for tool access
- Validate sensitive operations before execution
- Implement safety checks for destructive operations

### Enhanced Verification Workflows

#### Pre-Commit Verification (All Agents)
- **Version-control-agent coordinates** all pre-commit checks
- **Testing-agent ensures** tests pass before any commits
- **Backend/Frontend agents** run lint and type checking before commits
- **Control-agent validates** agent coordination before major commits

#### Continuous Integration Workflow
1. **Planning-agent** creates requirements and architecture
2. **Research-agent** provides technical documentation
3. **Backend-agent** implements and tests APIs (commits every 30-60 min)
4. **Frontend-agent** implements UI against APIs (commits every 30-60 min)
5. **Testing-agent** validates full functionality
6. **Documentation-agent** updates all documentation
7. **Version-control-agent** coordinates final commits and deployment
8. **Control-agent** validates entire workflow completion

#### Quality Gates Between Agents
- **Planning → Research**: Architecture approved before research begins
- **Research → Backend**: Technical docs complete before backend implementation
- **Backend → Frontend**: APIs tested and documented before frontend work
- **Frontend → Testing**: UI complete before comprehensive testing
- **Testing → Documentation**: All tests pass before final documentation
- **Documentation → Version Control**: Docs complete before release preparation

## Memory Management

### Context Preservation
- Import relevant memory files using @path/to/file syntax
- Maintain project-specific context in CLAUDE.md
- Use hierarchical memory structure effectively
- Reference external documentation when needed

### Session Continuity
- Use --continue for recent conversation resumption
- Use --resume for selective conversation restoration
- Maintain conversation history for context
- Preserve tool state across sessions

## Automation Patterns

### Event-Driven Workflows
- Use hooks for automated quality checks
- Implement pre-commit validation
- Set up post-deployment verification
- Enable continuous integration triggers

### Proactive Actions
- Monitor for common error patterns
- Suggest improvements during development
- Automate repetitive tasks
- Provide contextual recommendations

## Error Handling Strategy

### Graceful Degradation
- Implement fallback strategies for tool failures
- Provide alternative approaches when blocked
- Maintain progress despite partial failures
- Document issues for future resolution

### Recovery Patterns
- Save work frequently during long operations
- Create checkpoints for complex workflows
- Enable rollback capabilities
- Maintain audit trails for debugging

## Quality Assurance

### Multi-Agent Quality Standards

#### Code Quality (Backend & Frontend Agents)
- Follow established coding conventions per agent specialization
- Implement comprehensive testing with testing-agent coordination
- Maintain documentation standards with documentation-agent
- Ensure security best practices with backend-agent validation

#### Agent-Specific Quality Gates
- **Planning Agent**: Complete architecture and requirements before implementation
- **Research Agent**: Provide comprehensive technical documentation to implementation agents
- **Backend Agent**: API endpoints tested and documented before frontend integration
- **Frontend Agent**: Components tested and accessible before feature completion
- **Testing Agent**: 90%+ coverage achieved and all tests passing
- **Documentation Agent**: All features documented with examples and troubleshooting
- **Version Control Agent**: Clean commit history with proper agent attribution

### Verification Requirements
- **Control-agent validates** all agent coordination and handoffs
- **Testing-agent ensures** all functionality tested before completion
- **Documentation-agent verifies** requirements documented and validated
- **Version-control-agent confirms** all work properly committed and tagged
- **Multi-agent review** for accessibility compliance and performance benchmarks

## Communication Protocols

### Mandatory Agent Reporting Templates

#### Before Starting Work
```
🤖 [Agent Name] requesting authorization for [task]
Scope: [detailed scope]
Dependencies: [other agents/tasks]
Estimated time: [duration]
Conflicts: [potential conflicts with other work]
```

#### Progress Updates (Every 30-60 minutes)
```
📊 [Agent Name] progress update
Completed: [what's done]
Current: [what's in progress]
Next: [next steps]
Blockers: [any issues]
Commits: [commits made since last update]
ETA: [revised completion time]
```

#### Completion Reports
```
🎉 [Agent Name] completed [task]
Deliverables: [what was produced]
Files changed: [list of files]
Commits made: [list of commits with messages]
Tests: [test status]
Ready for: [next steps/handoffs]
Issues: [any problems encountered]
```

### Control-Agent Coordination Responses

#### Authorization Responses
```
✅ Control Agent: [Agent Name] authorized for [task]
Priority: [high/medium/low]
Coordination: [instructions for other agents]
Timeline: [expected completion]
Commit frequency: [every 30-60 minutes]
Next check-in: [when to report back]
```

#### Progress Acknowledgments
```
✅ Progress acknowledged. Continue with [next step]
Commit by: [time]
Coordination needed: [if any]
```

### Documentation Standards
- Document decisions and rationale with agent attribution
- Maintain up-to-date technical specs after each agent's work
- Provide usage examples with implementation notes
- Include troubleshooting guides updated by testing-agent
- Cross-reference between agent deliverables

## Continuous Improvement

### Agent Coordination Learning
- **Capture coordination patterns** that work well between agents
- **Update agent protocols** based on successful multi-agent workflows
- **Refine handoff procedures** between specialized agents
- **Optimize commit frequency** based on agent productivity patterns
- **Document successful agent combinations** for different task types

### Enhanced Metrics and Feedback
- **Agent Response Time**: How quickly agents respond to control-agent requests
- **Commit Frequency Compliance**: Percentage of agents maintaining <60 minute intervals
- **Quality Gate Success Rate**: Successful handoffs between agents without rework
- **Multi-Agent Efficiency**: Time saved through parallel agent execution
- **Error Reduction**: Decrease in bugs through systematic agent coordination
- **User satisfaction** with coordinated development workflows

## Security Considerations

### Sensitive Data Handling
- Never commit secrets or keys
- Use environment variables for configuration
- Implement proper access controls
- Audit sensitive operations

### Safe Automation
- Validate all automated actions
- Implement safety boundaries
- Monitor for unexpected behavior
- Maintain human oversight capability

## Agent Troubleshooting

### Common Coordination Issues

#### Agent Not Reporting
**Problem**: Agent working without reporting to control-agent
**Solution**: Immediately request agent status and enforce reporting protocol

#### Missed Commits
**Problem**: Agent hasn't committed in >60 minutes
**Solution**: Force immediate commit of current progress, regardless of completion state

#### Agent Conflicts
**Problem**: Multiple agents trying to modify same files
**Solution**: Control-agent coordinates file ownership and sequential access

#### Quality Gate Failures
**Problem**: Agent proceeding without previous agent's completion
**Solution**: Enforce dependency chain and validate handoff requirements

### Emergency Procedures

#### Agent Recovery
```
1. Control-agent takes immediate control
2. All agents report current status
3. Force commits of all current work
4. Assess conflicts and blockers
5. Reassign tasks and restart coordination
```

#### Workflow Reset
```
1. Version-control-agent creates checkpoint
2. Control-agent documents current state
3. Planning-agent reassesses requirements
4. Research-agent provides updated documentation
5. Resume with proper coordination protocols
```

## Integration with Project Templates

### React/TypeScript/Shadcn/Tailwind Projects
Import project-specific patterns: `@~/.claude/agents/PROJECT_CLAUDE.md`

### Custom Project Types
Create project-specific CLAUDE.md files that extend this global workflow while maintaining:
- Mandatory agent reporting protocols
- 60-minute maximum commit frequency
- Control-agent coordination requirements
- Multi-agent quality gates

## Practical Workflow Examples

### Example 1: "I want to build a task management app"
```
1. Control-agent: Analyzes request, activates planning and research agents
2. Planning-agent: Creates project brief, architecture, and backlog (commits every 30 min)
3. Research-agent: Researches task management patterns, React best practices (parallel with planning)
4. Control-agent: Coordinates handoff from planning to backend implementation
5. Backend-agent: Implements Firebase schema, Auth, APIs (commits every 30-60 min, reports progress)
6. Frontend-agent: Builds React components, integrates APIs (commits every 30-60 min)
7. Testing-agent: Creates comprehensive tests, validates functionality
8. Documentation-agent: Updates docs continuously throughout process
9. Version-control-agent: Manages commits, creates release branch
10. Control-agent: Validates completion and coordinates final delivery
```

### Example 2: "Add user authentication to existing app"
```
1. Control-agent: Assesses scope, determines this is a medium complexity task
2. Research-agent: Reviews current auth implementation, gathers security best practices
3. Backend-agent: Implements Firebase Auth, security rules (reports to control-agent)
4. Frontend-agent: Adds login/register UI, integrates auth state
5. Testing-agent: Tests auth flows, security scenarios
6. Documentation-agent: Updates API docs, security guidelines
7. Version-control-agent: Coordinates feature branch, creates PR
```

### Example 3: "Fix this React component error"
```
1. Control-agent: Identifies this as frontend issue, activates frontend-agent
2. Frontend-agent: Analyzes error, implements fix, tests locally
3. Testing-agent: Validates fix doesn't break existing functionality
4. Version-control-agent: Creates commit with fix
5. Documentation-agent: Updates troubleshooting guide if needed
```

## Quick Reference: Agent Coordination Commands

### Starting Multi-Agent Workflows
```bash
# Activate control-agent for coordination:
> Use the control-agent to coordinate building [feature]
> Have the control-agent orchestrate [complex task]

# Explicit agent activation:
> Use the planning-agent to plan [new app/feature]
> Have the research-agent investigate [technology/api]
> Ask the backend-agent to implement [backend feature]
> Have the frontend-agent build [ui component]
> Use the testing-agent to test [functionality]
> Ask the documentation-agent to document [feature]
> Use the version-control-agent to [git operation]
```

### Monitoring Agent Coordination
```bash
# Check agent status:
> Control-agent, show current agent status
> What agents are currently active?

# Force coordination:
> Control-agent, coordinate all agents for current task
> Ensure all agents are reporting properly
```

---

This enhanced global workflow provides the foundation for coordinated, high-quality Claude Code operations across all projects. All agents must follow these protocols for optimal collaboration, frequent commits, and consistent results.