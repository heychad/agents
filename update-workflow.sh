#!/bin/bash

# Workflow for managing upstream updates while preserving your custom agents

echo "🔄 Agent Repository Update Workflow"
echo "=================================="

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to show current state
show_status() {
    echo -e "\n${BLUE}Current branch structure:${NC}"
    echo "  main → Tracks upstream (Contains Studio)"
    echo "  prod → Your stable agents (production)"
    echo "  dev  → Active development"
    echo ""
    CURRENT_BRANCH=$(git branch --show-current)
    echo -e "Current branch: ${GREEN}$CURRENT_BRANCH${NC}"
}

# Function to sync with upstream
sync_upstream() {
    echo -e "\n${YELLOW}Syncing with upstream...${NC}"
    
    # Save current branch
    CURRENT_BRANCH=$(git branch --show-current)
    
    # Update main from upstream
    git checkout main
    git fetch upstream
    git reset --hard upstream/main
    echo -e "${GREEN}✓ Main branch updated from upstream${NC}"
    
    # Return to original branch
    git checkout $CURRENT_BRANCH
}

# Function to merge upstream updates
merge_upstream_updates() {
    echo -e "\n${YELLOW}Checking for upstream updates to merge...${NC}"
    
    # Save current branch
    CURRENT_BRANCH=$(git branch --show-current)
    
    # Create a temporary branch to review changes
    git checkout main
    git checkout -b upstream-review
    
    # Show what's new from upstream
    echo -e "\n${BLUE}New files from upstream:${NC}"
    git diff --name-status HEAD~1 HEAD | grep "^A"
    
    echo -e "\n${BLUE}Modified files from upstream:${NC}"
    git diff --name-status HEAD~1 HEAD | grep "^M"
    
    # Prompt for action
    echo -e "\n${YELLOW}What would you like to do?${NC}"
    echo "1. Merge specific files/agents to dev"
    echo "2. Review changes in detail"
    echo "3. Skip this update"
    read -p "Choice (1-3): " choice
    
    case $choice in
        1)
            echo "Enter the path of files to merge (space-separated):"
            read files_to_merge
            git checkout dev
            for file in $files_to_merge; do
                git checkout upstream-review -- "$file" 2>/dev/null && \
                echo -e "${GREEN}✓ Merged: $file${NC}" || \
                echo -e "${RED}✗ Failed: $file${NC}"
            done
            ;;
        2)
            git diff HEAD~1 HEAD
            ;;
        3)
            echo "Skipping update"
            ;;
    esac
    
    # Cleanup
    git checkout $CURRENT_BRANCH
    git branch -D upstream-review 2>/dev/null
}

# Function to promote dev to prod
promote_to_prod() {
    echo -e "\n${YELLOW}Promoting dev to production...${NC}"
    
    # Ensure we're on prod
    git checkout prod
    
    # Merge dev into prod
    git merge dev
    
    echo -e "${GREEN}✓ Production updated from dev${NC}"
    echo -e "${YELLOW}Don't forget to push: git push origin prod${NC}"
}

# Main menu
case "${1:-}" in
    status)
        show_status
        ;;
    sync)
        sync_upstream
        ;;
    merge)
        merge_upstream_updates
        ;;
    promote)
        promote_to_prod
        ;;
    *)
        echo "Usage: $0 [command]"
        echo ""
        echo "Commands:"
        echo "  status   - Show current branch structure"
        echo "  sync     - Sync main branch with upstream"
        echo "  merge    - Review and merge upstream updates"
        echo "  promote  - Promote dev changes to production"
        echo ""
        echo "Typical workflow:"
        echo "  1. ./update-workflow.sh sync     # Get latest from Contains Studio"
        echo "  2. ./update-workflow.sh merge    # Selectively merge updates"
        echo "  3. Work on dev branch            # Develop your features"
        echo "  4. ./update-workflow.sh promote  # Deploy to production"
        ;;
esac