#!/bin/bash

# Script to sync Contains Studio agents from upstream

echo "🔄 Syncing Contains Studio agents from upstream..."

# Fetch latest from upstream
git fetch upstream

# Save current branch
CURRENT_BRANCH=$(git branch --show-current)

# Create temporary branch for merging
git checkout -b temp-upstream-sync upstream/main

# Move their agents to contains-studio folder
echo "📦 Moving upstream agents to contains-studio/ folder..."
mkdir -p contains-studio-temp
mv bonus design engineering marketing product project-management studio-operations testing contains-studio-temp/ 2>/dev/null || true

# Switch back to development branch
git checkout $CURRENT_BRANCH

# Merge changes
git checkout contains-studio-temp/. contains-studio/ 2>/dev/null || true

# Clean up
rm -rf contains-studio-temp
git branch -D temp-upstream-sync

echo "✅ Sync complete! Contains Studio agents have been updated in contains-studio/ folder"
echo "📝 Don't forget to commit these changes if there were updates"