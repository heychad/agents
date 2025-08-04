# My Custom Claude Agents

This repository contains my custom agents for Claude, organized by purpose.

## 📁 Repository Structure

```
agents/
├── personal/              # Personal utility agents
│   └── personal-app-builder.md
├── work/                  # Work-related agents
│   └── product-manager.md
├── agents-config.json     # Configuration
├── update-workflow.sh     # Branch management script
└── WORKFLOW.md           # Development workflow guide
```

## 🤖 Active Agents

### Personal Agents

#### Personal App Builder
- **Location**: `personal/personal-app-builder.md`
- **Purpose**: Rapidly prototype simple personal utility apps
- **Based on**: rapid-prototyper (customized)
- **Use cases**: File organizers, personal dashboards, automation tools

### Work Agents

#### Product Manager
- **Location**: `work/product-manager.md`
- **Purpose**: Healthcare tech product management
- **Specialty**: HIPAA compliance, sprint planning, backlog management
- **Domain**: Healthcare technology

## 🚀 Development Workflow

### Branches
- **main**: Clean upstream reference (Contains Studio)
- **dev**: Development and testing
- **prod**: Production-ready custom agents (this branch)

### Adding New Agents
1. Work on `dev` branch
2. Create agent in `personal/` or `work/`
3. Test thoroughly
4. Promote to `prod` when ready

### Getting Inspiration from Contains Studio
```bash
# On dev branch, selectively copy agents to customize
git checkout dev
git checkout main -- contains-studio/[agent-to-customize].md
# Move to personal/ or work/ and customize
```

## 📝 Configuration

See `agents-config.json` for:
- Agent definitions
- Environment settings
- Branch configurations

## 🔧 Tools

- `update-workflow.sh` - Manage branches and updates
- `WORKFLOW.md` - Detailed workflow documentation