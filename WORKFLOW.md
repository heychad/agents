# Agent Development Workflow

## Branch Structure

```
upstream/main  →  main  →  dev
                    ↓       ↓
                  prod ←────┘
```

### Branches:
- **main**: Clean mirror of upstream (Contains Studio)
- **prod**: Your stable, production-ready agents
- **dev**: Active development and testing

## Common Workflows

### 1. Daily Development
```bash
git checkout dev
# Make changes, test agents
git add .
git commit -m "Add new feature"
git push origin dev
```

### 2. Getting Updates from Contains Studio
```bash
# Sync main with upstream
./update-workflow.sh sync

# Review and selectively merge updates
./update-workflow.sh merge
```

### 3. Deploying to Production
```bash
# When dev is stable and tested
./update-workflow.sh promote
git push origin prod
```

### 4. Creating New Agents
```bash
git checkout dev

# Personal agents go in personal/
# Work agents go in work/

# Create agent, test it
git add .
git commit -m "Add new agent"
```

## Key Principles

1. **Never commit directly to main** - It should mirror upstream
2. **Test on dev** before promoting to prod
3. **Selectively merge** upstream updates (don't blindly accept all)
4. **Keep your agents separate** from Contains Studio agents

## Scenarios

### "I want to try a new Contains Studio agent"
1. `./update-workflow.sh sync` - Get latest
2. `./update-workflow.sh merge` - Copy specific agent to dev
3. Test and customize on dev
4. Move to personal/ or work/ folder when ready

### "I made a mess and want to start fresh"
```bash
git checkout main
git branch -D dev
git checkout -b dev
# Your custom agents in personal/ and work/ are preserved
```

### "I want to contribute back to Contains Studio"
1. Create a feature branch from upstream/main
2. Copy your agent to appropriate Contains Studio folder
3. Submit PR to upstream

## Your Custom Agents

Always safe in:
- `personal/` - Your personal utility agents
- `work/` - Your professional/healthcare agents
- `contains-studio/` - Reference only (updated from upstream)

These folders are ignored when syncing with upstream, so your work is always preserved.