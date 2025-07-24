#!/bin/bash

# 🚀 Quick Release Script for Tic-Tac-Toe
# This script helps you create and publish a new version

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🎮 Tic-Tac-Toe Release Helper${NC}"
echo "=================================="

# Check if we're in the right directory
if [ ! -f "pyproject.toml" ]; then
    echo -e "${RED}❌ Error: pyproject.toml not found. Are you in the project root?${NC}"
    exit 1
fi

# Get current version
CURRENT_VERSION=$(grep -E '^version = ' pyproject.toml | sed 's/version = "\(.*\)"/\1/')
echo -e "${BLUE}📋 Current version: ${YELLOW}$CURRENT_VERSION${NC}"

# Ask for new version
echo -e "${BLUE}📝 Enter new version (e.g., 0.1.1, 0.2.0, 1.0.0):${NC}"
read -p "New version: " NEW_VERSION

if [ -z "$NEW_VERSION" ]; then
    echo -e "${RED}❌ Version cannot be empty${NC}"
    exit 1
fi

# Validate version format
if ! [[ $NEW_VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo -e "${RED}❌ Invalid version format. Use semantic versioning (e.g., 1.0.0)${NC}"
    exit 1
fi

echo -e "${YELLOW}🔄 Updating version in pyproject.toml...${NC}"

# Update version in pyproject.toml (Windows compatible)
if [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    # Windows/Git Bash
    sed -i "s/version = \"$CURRENT_VERSION\"/version = \"$NEW_VERSION\"/" pyproject.toml
else
    # Linux/macOS
    sed -i.bak "s/version = \"$CURRENT_VERSION\"/version = \"$NEW_VERSION\"/" pyproject.toml && rm pyproject.toml.bak 2>/dev/null || true
fi

echo -e "${GREEN}✅ Version updated to $NEW_VERSION${NC}"

# Ask for release notes
echo -e "${BLUE}📝 Enter release notes (press Enter twice when done):${NC}"
RELEASE_NOTES=""
while IFS= read -r line; do
    if [ -z "$line" ] && [ -n "$RELEASE_NOTES" ]; then
        break
    fi
    if [ -n "$RELEASE_NOTES" ]; then
        RELEASE_NOTES="$RELEASE_NOTES\n$line"
    else
        RELEASE_NOTES="$line"
    fi
done

if [ -z "$RELEASE_NOTES" ]; then
    RELEASE_NOTES="Release version $NEW_VERSION"
fi

echo -e "${YELLOW}🔄 Committing version bump...${NC}"
git add pyproject.toml
git commit -m "Bump version to $NEW_VERSION"

echo -e "${YELLOW}🔄 Creating and pushing tag...${NC}"
git tag -a "v$NEW_VERSION" -m "Release version $NEW_VERSION"
git push origin develop
git push origin "v$NEW_VERSION"

echo -e "${GREEN}🎉 Success! Release v$NEW_VERSION created!${NC}"
echo ""
echo -e "${BLUE}📦 What happens next:${NC}"
echo "  1. GitHub Actions will build and publish to PyPI"
echo "  2. Docker image will be built and pushed to Docker Hub"
echo "  3. Check the Actions tab for progress"
echo ""
echo -e "${BLUE}🔗 Monitor your release:${NC}"
echo "  • GitHub: https://github.com/v-s-v-i-s-h-w-a-s/tic-tac-toe/releases"
echo "  • PyPI: https://pypi.org/project/tictactoe-vish/"
echo "  • Docker Hub: https://hub.docker.com/r/vishwas/tic-tac-toe"
echo ""
echo -e "${GREEN}🚀 Happy releasing!${NC}"
