# Claude Code Multi-Agent System - MANDATORY GLOBAL WORKFLOW

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

## About the Framework

A sophisticated multi-agent system for Claude Code that provides intelligent development assistance with **mandatory workflow enforcement**, automatic agent delegation, and continuous learning capabilities.

## 🚨 NEW: MANDATORY GLOBAL WORKFLOW ENFORCEMENT

**This system now includes MANDATORY workflow enforcement that applies to EVERY interaction:**

- **Automatic Activation**: Workflow applies to all prompts without user request
- **Cannot Be Bypassed**: Works regardless of prompt content
- **Universal Application**: Active across ALL projects and sessions
- **Mandatory Delegation**: Control-agent MUST delegate, never execute directly
- **Hook-Based Enforcement**: Automatic injection of workflow context

## 🌟 Overview

This repository contains a complete multi-agent system designed to work globally with Claude Code across all your projects. For detailed documentation, see `docs/overview.md`, `docs/architecture.md`, and `docs/dev-setup.md`.

## 🤖 Agent Roster

### Core Agents

1. **Planning Agent** (Claude Opus 4)
   - Strategic project planning and task distribution
   - Multi-agent orchestration
   - Dependency management

2. **Control Agent**
   - Quality gate enforcement
   - Architecture compliance
   - >99% confidence requirement for all changes

3. **Research Agent**
   - Documentation research using Firecrawl MCP
   - Technology evaluation and feasibility assessment
   - Best practices compilation and synthesis

4. **UX Agent**
   - User experience design
   - Wireframing and workflows
   - Accessibility compliance (WCAG 2.1 AA)

5. **UI Agent**
   - React/TypeScript implementation
   - Component development with >90% test coverage
   - Tailwind CSS styling

6. **Backend Agent**
   - State management (Zustand)
   - API development
   - Database operations

7. **Testing Agent**
   - Quality assurance specialist
   - Vitest, Playwright, Storybook testing
   - Ensures 90%+ test coverage

8. **Documentation Agent**
   - API documentation
   - Developer guides
   - Architecture documentation

9. **Version Control Agent**
   - Git operations
   - Branch management
   - Release coordination

### Meta Agent

10. **Improvement Agent** (Dual-Layer)
   - **Project Layer** (Claude Sonnet 4): Continuous observation during projects
   - **Meta Layer** (Claude Opus 4): Post-project deep analysis
   - Global learning across all projects

## 📁 Directory Structure

```
~/.claude/
├── agents/                 # Global agent configurations
│   ├── planning-agent.md
│   ├── control-agent.md
│   ├── research-agent.md
│   ├── ux-agent.md
│   ├── ui-agent.md
│   ├── backend-agent.md
│   ├── testing-agent.md
│   ├── documentation-agent.md
│   ├── version-control-agent.md
│   └── improvement-agent.md
├── global-observation/     # Improvement agent's knowledge base
│   └── observation-ledger.json
├── ledgers/               # Agent task tracking
│   ├── planning-tasks.json
│   ├── control-tasks.json
│   ├── testing-tasks.json
│   └── ...
├── observation/           # Observation infrastructure
│   ├── activity-stream.json
│   ├── agent-hooks.md
│   └── ...
├── agent-protocols.md     # Communication protocols
└── task-registry.json     # Global task registry
```

**Repository Structure:**
```
Claude_Code_New/
├── agents/                    # Core agent definitions
├── ledgers/                   # Task tracking system
├── observation/               # Learning infrastructure
├── global-observation/        # Cross-project learning
├── docs/                      # Canonical documentation (overview, architecture, dev-setup, etc.)
├── .cursor/
│   └── rules/                 # Cursor Project Rules (MDC)
├── development_history/       # Development docs (gitignored)
├── CLAUDE.md                  # Core workflow
├── README.md                  # Entry point (links to docs/)
├── install.sh                 # Installation script
├── uninstall.sh               # Uninstallation script
├── setup-firecrawl-mcp.sh     # Firecrawl MCP setup script
├── settings-template.json     # Configuration template
├── task-registry.json         # System coordination
├── memory.md                  # Global memory
├── agent-protocols.md         # Communication protocols
├── example.env                # Environment variables template
├── LICENSE                    # Legal information
└── .gitignore                 # Version control exclusions
```

## 🚀 Installation

### Prerequisites
- Claude Code installed
- Git
- Unix-like environment (macOS/Linux)

### Quick Install

1. Clone this repository:
```bash
git clone https://github.com/[your-username]/claude-code-agent-system.git
cd claude-code-agent-system
```

2. Configure environment variables:
```bash
cp example.env .env
# Edit .env with your actual API keys (especially Firecrawl for research-agent)
```

3. Run the installation script:
```bash
./install.sh
```

4. Set up Firecrawl MCP (for research-agent):
```bash
./setup-firecrawl-mcp.sh
```

This will:
- Create necessary directories in `~/.claude/`
- Copy all agent configurations
- Set up the observation infrastructure
- Initialize the global observation ledger

### Manual Installation

If you prefer to install manually:

```bash
# Create directories
mkdir -p ~/.claude/{agents,global-observation,ledgers,observation}

# Copy agent configurations
cp agents/*.md ~/.claude/agents/

# Copy observation infrastructure
cp -r observation/* ~/.claude/observation/
cp -r ledgers/* ~/.claude/ledgers/

# Copy global files
cp task-registry.json ~/.claude/
cp agent-protocols.md ~/.claude/

# Initialize global observation ledger
cp global-observation/observation-ledger.json ~/.claude/global-observation/
```

## 🎯 Features

### 🚨 MANDATORY WORKFLOW ENFORCEMENT
- **Automatic Hook Injection**: Every prompt triggers workflow enforcement
- **Cannot Be Bypassed**: Applies regardless of user request
- **Control-Agent Delegation**: Automatic delegation to specialized agents
- **Universal Application**: Works across ALL projects and sessions
- **Memory Integration**: Persistent workflow awareness

### Continuous Learning
- Every project contributes to the global knowledge base
- Patterns emerge across multiple implementations
- Improvements are evidence-based and tested

### Multi-Agent Coordination
- Task distribution through ledger system
- Dependency tracking and management
- Quality gates at every stage
- **Mandatory reporting protocols** between agents

### Two-Layer Improvement System
- **Project Layer**: Silent observation during development
- **Meta Layer**: Deep analysis after project completion
- Cross-project pattern recognition
- Safe, tested improvements with user approval

### Global Availability
- Works across all Claude Code projects
- Persistent knowledge accumulation
- Shared learning between projects
- **Enforced consistency** across all environments

## 📊 How It Works

### Architecture Overview

The system operates with a **global + project-scoped** architecture:

#### 🌍 Global Level (Shared Across All Projects)
```bash
~/.claude/
├── agents/                    # Available in every project
│   ├── planning-agent.md     # Strategic planning
│   ├── control-agent.md      # Quality assurance  
│   ├── improvement-agent.md  # Continuous learning
│   └── ... (12 agents total)
├── global-observation/       # Cross-project learning
│   └── observation-ledger.json
└── ...
```

#### 📁 Project Level (Specific to Each Project)
```bash
/your-project/
├── .claude/
│   ├── settings.local.json   # Project-specific config
│   ├── ledgers/             # Task tracking for this project
│   └── project-data/        # Local observations
└── your-files...
```

### Workflow

1. **Install Once**: Agents become available in ALL Claude Code projects
2. **Auto-Activation**: Improvement Agent starts observing from first prompt
3. **Global Learning**: Every project contributes to shared knowledge base
4. **Cross-Project Benefits**: Patterns from Project A help Project B
5. **Continuous Evolution**: System gets smarter with each project

### Example Usage

```bash
# Install system
git clone https://github.com/emanuelgrammenos/claude-code-agent-system.git
cd claude-code-agent-system
./install.sh

# Now available everywhere
cd ~/my-react-app     # All 12 agents available
cd ~/my-python-app    # Same 12 agents available  
cd ~/any-project      # Consistent experience everywhere
```

### Learning Flow

- **Project A**: UI Agent learns React best practices
- **Project B**: UI Agent applies React knowledge to Vue project
- **Project C**: Benefits from both React and Vue experiences
- **Result**: Each project improves the entire system

## 🔧 Configuration

### Environment Variables
The system uses environment variables for secure API key management:

```bash
# Copy the example file
cp example.env .env

# Edit with your actual API keys
vim .env  # or use your preferred editor
```

**Required for Research Agent:**
- `firecrawl-api-key`: Get from [Firecrawl.dev](https://firecrawl.dev) for documentation scraping

### Agent Permissions
Each agent has specific tool permissions defined in their YAML frontmatter:
- Planning Agent: Full access (`["*"]`)
- Research Agent: Firecrawl MCP tools + standard tools
- UX Agent: Read-only tools
- UI/Backend Agents: Development tools
- Control Agent: Full access for oversight

### Customization
You can customize agents by editing their configuration files in `~/.claude/agents/`. Each agent file contains:
- YAML frontmatter with name, description, and tools
- Detailed role description and competencies
- Specific workflows and standards

## 📈 Optimization Goals

The Improvement Agent optimizes for:
1. **Efficiency**: Faster task completion
2. **Quality**: Fewer errors and bugs
3. **Collaboration**: Better agent synchronization
4. **Code**: Cleaner, simpler implementations
5. **Architecture**: Better design patterns
6. **Testing**: Higher first-pass success
7. **Best Practices**: Latest frameworks and patterns

## 🔐 Security & Privacy

- All data stored locally in `~/.claude/`
- No external data transmission
- User approval required for all improvements
- Safe rollback procedures for all changes

## 🤝 Contributing

**Your contributions are what make this experimental framework truly exciting!** 🚀

Whether you're fixing bugs, proposing new features, improving documentation, or sharing wild ideas – all contributions are welcome:

- **🐛 Found a bug?** Open an issue! Even small bugs teach us something.
- **💡 Have an idea?** Start a discussion or draft a proposal.
- **🔧 Want to fix something?** Submit a pull request – no contribution is too small.
- **📚 Improve docs?** Documentation improvements are always appreciated.
- **🧪 Experiment with agents?** Share your experiments and learnings.

### Getting Started with Contributing

1. Fork the repository
2. Try the installation: `./install.sh`
3. Experiment with the agents
4. Share your discoveries, improvements, or questions

**No expertise required** – curiosity and enthusiasm are the most important qualities!

## 📝 License

MIT License - See LICENSE file for details

## 🙏 Acknowledgments

- **Huge thanks to [Anthropic](https://anthropic.com)** for creating [Claude Code](https://claude.ai/code) – this amazing tool makes these experiments possible
- **Inspired by the incredible AI community** and everyone pushing the boundaries of what's possible
- **Special appreciation for all contributors** – this framework grows stronger with every idea, bug report, and improvement
- **Gratitude to fellow hobbyists and enthusiasts** who believe in learning through experimentation

This project exists because of the amazing tools and community around AI development. Thank you for being part of this journey! 🌟

---

**Note**: This system is designed to work with Claude Code and requires proper Claude Code installation and configuration.