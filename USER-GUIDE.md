# 📚 Claude Code Agent System - User Guide

Complete guide to using the Claude Code Agent System's enhanced features, slash commands, and multi-agent workflows.

## 🎯 Quick Reference

### Installation Commands
```bash
# macOS Double-click installer
# Double-click: install.command

# Command line installer  
./install-enhanced.sh

# MCP server setup
./setup-mcp-servers.sh
```

### Essential Slash Commands
```bash
claude /start --quick        # Quick codebase analysis
claude /start --deep         # Deep codebase exploration  
claude /documentation        # Generate comprehensive docs
claude /ledger --check       # System health check
claude /meta --verify        # Meta-system verification
```

### System Status
```bash
claude mcp list              # Check MCP server connections
claude /ledger --metrics     # View system metrics
claude /ledger --repair      # Fix system issues
```

## 🚀 Getting Started

### 1. First Time Setup

After installation, verify everything is working:

```bash
# Check system health
claude /ledger --check

# Should show:
# 🏥 System Health: 95%+ (🟢 Excellent)
# 📡 MCP Servers: 5-7 connected
# 🤖 Agents: 10+ available
# 📊 Observation System: Ready
```

### 2. Your First Exploration

Start with codebase analysis:

```bash
# Quick exploration (recommended first)
claude /start --quick

# What happens:
# ✅ Control-agent coordinates the exploration
# ✅ Research-agent analyzes your codebase structure
# ✅ System achieves 90%+ understanding confidence  
# ✅ Knowledge stored for other commands
```

### 3. Generate Documentation

Use the exploration knowledge:

```bash
# Generate complete documentation suite
claude /documentation

# What gets created:
# 📄 docs/overview.md - Project overview and architecture
# 📄 docs/architecture.md - Technical design details
# 📄 docs/api.md - Complete API documentation  
# 📄 docs/dev-setup.md - Development setup guide
# 📄 docs/testing.md - Testing procedures
# 📄 And more...
```

## 🎛️ Slash Commands Reference

### `/start` - Deep Codebase Exploration

**Purpose:** Achieve comprehensive understanding of your codebase (>95% confidence)

#### Usage Options
```bash
# Quick exploration (5-10 minutes)
claude /start --quick

# Deep analysis (15-30 minutes, recommended)  
claude /start --deep

# Focus on specific area
claude /start --focus backend
claude /start --focus frontend
claude /start --focus database
```

#### What It Does
1. **Architecture Discovery**
   - Maps tech stack, frameworks, libraries
   - Identifies modules, services, components
   - Analyzes data flow and integration points

2. **Feature Analysis**  
   - Catalogs all implemented features
   - Documents business logic and workflows
   - Maps user journeys and API endpoints

3. **Quality Assessment**
   - Evaluates code organization and patterns
   - Assesses testing coverage and strategies
   - Identifies technical debt and improvements

#### Output Example
```
📊 Codebase Understanding Complete
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 Overall Confidence: 95.2%
├── Architecture: 96% (✅ Complete)
├── Features: 94% (✅ Complete)
├── Code Quality: 97% (✅ Complete)
└── Integration: 93% (✅ Complete)

🏗️ Architecture Overview:
- Tech Stack: React + TypeScript + Node.js + PostgreSQL
- Pattern: Microservices with event-driven communication
- Scale: 47 services, 156 API endpoints, 23 data models

🚀 Ready for: /documentation, /testing, advanced development
💾 Knowledge stored in: memory MCP + vector database
```

### `/documentation` - Intelligent Documentation Generation

**Purpose:** Generate comprehensive, accurate documentation based on codebase understanding

#### Prerequisites
- `/start` command must be completed with >90% confidence
- Memory MCP server with exploration results
- Vector database integration (optional but recommended)

#### Usage Options
```bash
# Generate complete documentation suite
claude /documentation

# Specific output format
claude /documentation --format html
claude /documentation --format pdf

# Specific detail level
claude /documentation --depth basic
claude /documentation --depth detailed      # default
claude /documentation --depth comprehensive

# Update existing docs only
claude /documentation --update-only

# Archive old documentation
claude /documentation --archive-old
```

#### Generated Documentation
The command creates a complete documentation suite:

```
📚 Documentation Generated:
├── docs/overview.md - Project purpose and user journeys
├── docs/architecture.md - System design and patterns  
├── docs/api.md - Complete API reference with examples
├── docs/data-model.md - Database design and relationships
├── docs/dev-setup.md - Development environment setup
├── docs/testing.md - Testing strategy and procedures
├── docs/security.md - Security implementation guide
├── docs/code-map.md - Directory structure reference
└── docs/decisions/0001-architecture-baseline.md - Architecture decisions
```

#### Features
- **Context-Aware**: Uses actual codebase analysis, not generic templates
- **Mermaid Diagrams**: Generates visual architecture and data flow diagrams
- **Code Examples**: Extracts real code examples from your implementation  
- **Cross-References**: Creates internal links between documentation sections
- **Smart Merging**: Preserves valuable existing documentation

### `/ledger` - Global System Health & Metrics

**Purpose:** Monitor system health, analyze improvement patterns, and track performance

#### Usage Options
```bash
# Basic health check
claude /ledger --check

# Detailed metrics and trends
claude /ledger --metrics

# Export data for analysis
claude /ledger --export --format csv
claude /ledger --export --format json

# Repair system issues
claude /ledger --repair

# Verbose diagnostic information
claude /ledger --check --verbose
```

#### Health Check Output
```
🏥 Global Ledger Health Check Complete
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 Overall Health Score: 94% (🟢 Excellent)
├── Structure: 98% (✅ Clean)
├── Content: 92% (✅ High Quality)  
├── Performance: 89% (✅ Efficient)
├── Integration: 96% (✅ Connected)
└── Optimization: 91% (✅ Well-Tuned)

📈 Key Metrics:
- Total observations: 1,247
- Average impact score: 7.2/10
- Implementation rate: 73%
- Token efficiency: 2.3 improvements/1000 tokens
- Cross-project learning: 89% knowledge transfer
```

#### Metrics Analysis
- **Improvement Velocity**: How quickly the system is improving
- **Cost Efficiency**: Token usage vs improvements delivered
- **Agent Performance**: Individual agent success rates
- **Learning Transfer**: Knowledge sharing between projects
- **Quality Trends**: Code quality improvements over time

### `/meta` - Meta-Layer Self-Improvement

**Purpose:** Analyze and improve the improvement system itself using advanced reasoning (Opus)

#### Usage Options
```bash
# Verify system integrity
claude /meta --verify

# Activate meta-layer improvements  
claude /meta --enhance

# Deep analysis of improvement opportunities
claude /meta --analyze

# Generate comprehensive status report
claude /meta --report

# Use highest-capability model (default)
claude /meta --opus-mode
```

#### System Verification
```
🧠 Meta-Layer System Status Report
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 Overall System Health: 96% (🟢 Excellent)
├── Agent Coordination: 94% (✅ Highly Effective)
├── Learning System: 98% (✅ Superior Performance)  
├── Automation: 92% (✅ Reliable)
├── Integration: 97% (✅ Seamless)
└── Meta-Intelligence: 95% (✅ Advanced)

🚀 Recent Meta-Improvements:
1. Enhanced agent delegation patterns (+15% efficiency)
2. Improved observation quality scoring (+23% accuracy)
3. Optimized hook trigger mechanisms (+31% reliability)
4. Advanced pattern recognition algorithms (+18% precision)
```

#### Meta-Improvement Process
1. **System State Analysis**: Comprehensive assessment of current performance
2. **Meta-Pattern Discovery**: Cross-project pattern analysis using Opus
3. **Enhancement Strategy**: Prioritized improvement recommendations
4. **Implementation Planning**: Coordinated system upgrades

## 🤖 Agent Coordination Workflows

### Understanding Agent Roles

The system includes 10+ specialized agents that work together:

#### Core Coordination
- **Control Agent**: Orchestrates all workflows, enforces quality gates
- **Planning Agent**: Strategic project planning and task distribution
- **Research Agent**: Technical research using Firecrawl MCP and vector database

#### Development Specialists
- **Frontend Agent**: React/TypeScript/Tailwind CSS implementation
- **Backend Agent**: API development, database operations, state management
- **Testing Agent**: Quality assurance with framework auto-detection (Vitest, Jest, Playwright)

#### Quality & Documentation
- **Documentation Agent**: Comprehensive documentation generation
- **Version Control Agent**: Git operations and release coordination
- **UX Agent**: User experience design and accessibility compliance

#### System Intelligence
- **Improvement Agent**: Continuous learning and system evolution (dual-layer: Sonnet + Opus)

### Example Workflows

#### Building a New Feature
```
User: "I want to build a user dashboard with analytics"

🎯 Agent Coordination:
1. Control-agent analyzes requirements
2. Planning-agent creates project architecture
3. Research-agent gathers dashboard best practices
4. UX-agent designs user flows and wireframes
5. Frontend-agent implements React components
6. Backend-agent creates APIs and data models
7. Testing-agent ensures comprehensive test coverage
8. Documentation-agent updates all docs
9. Version-control-agent manages commits and deployment
```

#### Code Review & Optimization
```
User: "Review and optimize this React component"

🎯 Agent Coordination:
1. Control-agent identifies this as frontend work
2. Frontend-agent analyzes component code
3. Testing-agent checks test coverage and quality
4. Research-agent finds current React best practices  
5. Frontend-agent implements optimizations
6. Testing-agent validates improvements
7. Documentation-agent updates component docs
8. Version-control-agent commits changes
```

#### Bug Investigation
```
User: "There's a bug in the user authentication"

🎯 Agent Coordination:
1. Control-agent triages the issue
2. Backend-agent analyzes authentication code
3. Testing-agent reproduces the bug with tests
4. Research-agent checks security best practices
5. Backend-agent implements the fix
6. Testing-agent validates the fix works
7. Documentation-agent updates security docs
8. Version-control-agent commits with detailed message
```

## 📊 Monitoring & Analytics

### System Health Monitoring

#### Daily Health Checks
```bash
# Quick daily check
claude /ledger --check

# Weekly detailed analysis
claude /ledger --metrics --verbose

# Monthly system optimization
claude /meta --enhance
```

#### Key Metrics to Watch

1. **Health Score** (Target: >90%)
   - Overall system functionality
   - Agent coordination efficiency
   - Integration stability

2. **Token Efficiency** (Target: >2 improvements/1000 tokens)
   - Cost per improvement delivered
   - Model usage optimization
   - Resource utilization

3. **Implementation Rate** (Target: >70%)
   - Observations converted to improvements
   - Successful agent coordination
   - Quality of system recommendations

4. **Learning Transfer** (Target: >80%)
   - Cross-project knowledge sharing
   - Pattern recognition accuracy
   - System evolution rate

### Performance Optimization

#### Automatic Optimizations
The system continuously optimizes:
- **Agent Coordination**: Streamlines workflows based on success patterns
- **Token Usage**: Learns to be more efficient with language model calls
- **Quality Gates**: Adjusts quality thresholds based on project needs
- **Learning Patterns**: Improves pattern recognition algorithms

#### Manual Optimization
```bash
# Force system optimization
claude /meta --enhance

# Repair performance issues
claude /ledger --repair

# Clean up observation data
claude /ledger --export --archive-old
```

## 🔧 Advanced Configuration

### Custom Hooks

The system supports custom automation hooks:

#### Pre-Commit Hook (Auto-formatting)
```bash
# Location: ~/.claude/hooks/auto-format.sh
# Automatically formats code before commits
# Supports: Prettier (JS/TS), Ruff (Python), and more
```

#### Safety Guard Hook
```bash  
# Location: ~/.claude/hooks/guard-unsafe.sh
# Prevents dangerous operations
# Blocks: rm -rf, sudo rm, format commands
```

#### Creating Custom Hooks
```bash
# Create new hook
cat > ~/.claude/hooks/my-custom-hook.sh << 'EOF'
#!/bin/bash
# Your custom automation here
echo "Custom hook executed"
EOF

# Make executable
chmod +x ~/.claude/hooks/my-custom-hook.sh

# Register in settings.json
vim ~/.claude/settings.json
```

### MCP Server Management

#### Adding New Servers
```bash
# Add a new MCP server
claude mcp add server-name -s user -- command-to-run

# Example: Add a custom server
claude mcp add my-server -s user -- python3 /path/to/my-server.py
```

#### Server Health Monitoring
```bash
# Check all server connections
claude mcp list

# Get detailed server info
claude mcp get server-name

# Remove problematic server  
claude mcp remove server-name -s user
```

### Vector Database Integration

#### Setting Up Vector Database
```bash
# The MCP setup will help you configure this
./setup-mcp-servers.sh

# Look for databases in common locations:
# /Volumes/*/VectorDatabase/*
# ~/VectorDatabase/* 
# ~/Development/*/VectorDB*
```

#### Using Vector Search
Once configured, the research agent can:
- Search your indexed documentation semantically  
- Find relevant code patterns across projects
- Provide context-aware recommendations
- Learn from your existing knowledge base

## 🚨 Emergency Procedures

### System Recovery

#### If Agents Stop Responding
```bash
# 1. Check system health
claude /ledger --check

# 2. Verify MCP connections
claude mcp list

# 3. Repair system issues
claude /ledger --repair

# 4. Restart Claude Code
pkill -f claude
# Reopen Claude Code application
```

#### If Slash Commands Fail
```bash
# 1. Verify command templates exist
ls -la ~/.claude/templates/commands/

# 2. Re-run installation
./install-enhanced.sh

# 3. Check system configuration
cat ~/.claude/settings.json
```

#### If Performance Degrades
```bash
# 1. Check token usage
claude /ledger --metrics

# 2. Clean up observation data  
claude /ledger --export --archive-old

# 3. Optimize system
claude /meta --enhance

# 4. Restart with clean slate
claude /ledger --repair --force
```

### Backup & Recovery

#### Backup Your Configuration
```bash
# Backup entire Claude directory
tar -czf claude-backup-$(date +%Y%m%d).tar.gz ~/.claude/

# Backup just the important data
cp ~/.claude/global-observation/observation-ledger.json ~/claude-ledger-backup.json
cp ~/.claude/settings.json ~/claude-settings-backup.json
```

#### Restore Configuration
```bash
# Restore from backup
tar -xzf claude-backup-YYYYMMDD.tar.gz -C ~/

# Or restore individual files
cp ~/claude-ledger-backup.json ~/.claude/global-observation/observation-ledger.json
cp ~/claude-settings-backup.json ~/.claude/settings.json
```

## 📈 Maximizing System Value

### Best Practices

1. **Regular Health Checks**: Run `/ledger --check` daily
2. **Use All Slash Commands**: Each command enhances the others
3. **Let Agents Coordinate**: Don't micromanage, trust the system
4. **Monitor Metrics**: Track improvement trends over time
5. **Keep System Updated**: Re-run installer for updates

### Learning Patterns

The system learns most effectively when you:
- **Work on diverse projects**: Exposes system to different patterns
- **Use consistent workflows**: Helps establish successful patterns  
- **Provide feedback**: System learns from your preferences
- **Allow agent coordination**: Don't bypass the workflow
- **Regular maintenance**: Keep system healthy and optimized

### Power User Tips

1. **Combine Commands**: Use `/start` before `/documentation` for best results
2. **Monitor Token Efficiency**: Track in `/ledger --metrics`
3. **Leverage Vector Search**: Configure vector database for enhanced research
4. **Custom Workflows**: Create project-specific configurations
5. **Cross-Project Learning**: Work on multiple projects to maximize learning

---

## 🎓 Conclusion

The Claude Code Agent System is designed to become smarter and more valuable with every interaction. Start with the basics, explore the slash commands, and watch as the system learns your patterns and preferences.

**Remember:** The system is most powerful when you trust the agent coordination workflow. Let the control-agent orchestrate, let specialized agents work in their areas of expertise, and monitor progress through the observation system.

For additional help, use the built-in diagnostics (`/ledger --check`) or refer to the troubleshooting section. The system is designed to be self-healing and continuously improving.

**Happy coding!** 🚀