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
- **prod**: Production-ready custom agents

### Adding New Agents from Upstream

```bash
# 1. Switch to dev branch
git checkout dev

# 2. Cherry-pick a specific agent from upstream
git checkout upstream/main -- engineering/rapid-prototyper.md

# 3. Move to your folder and customize
mv engineering/rapid-prototyper.md personal/my-custom-agent.md

# 4. Edit and customize for your needs
# Remove the engineering folder if created
rmdir engineering

# 5. Test thoroughly

# 6. When ready, promote to prod
git checkout prod
git checkout dev -- personal/my-custom-agent.md
```

### Creating New Agents from Scratch

1. Work on `dev` branch
2. Create agent in `personal/` or `work/`
3. Test thoroughly
4. Promote to `prod` when ready

## 📝 Configuration

See `agents-config.json` for:
- Agent definitions
- Environment settings
- Branch configurations

## 🔧 Tools

- `update-workflow.sh` - Manage branches and updates
- `WORKFLOW.md` - Detailed workflow documentation

## 🎯 Philosophy

This repository maintains only customized agents that I actively use. 
Upstream agents are pulled in individually as needed and customized for specific purposes.