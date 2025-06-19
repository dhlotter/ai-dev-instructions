#!/bin/bash

# Exit on error, undefined variables, and pipeline failures
set -euo pipefail

# Constants
VERSION="1.0.0"
GITHUB_REPO="dhlotter/ai-dev-instructions"
REPO_URL="https://github.com/$GITHUB_REPO"
API_URL="https://api.github.com/repos/$GITHUB_REPO/git/trees/HEAD?recursive=1"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check for required commands
check_requirements() {
    local missing=()
    for cmd in curl jq unzip; do
        if ! command -v "$cmd" &> /dev/null; then
            missing+=("$cmd")
        fi
    done
    
    if [ ${#missing[@]} -gt 0 ]; then
        echo -e "${YELLOW}Error: The following required commands are missing:${NC} ${missing[*]}"
        echo "Please install them before running this script."
        exit 1
    fi
}

# Show help
show_help() {
    echo "Setup script for AI development files"
    echo "Version: $VERSION"
    echo "Usage: $0 [options]"
    echo
    echo "Options:"
    echo "  -h, --help    Show this help message and exit"
    echo "  -v, --version Show version information and exit"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            show_help
            exit 0
            ;;
        -v|--version)
            echo "setup.sh version $VERSION"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
    shift
done

echo -e "${GREEN}Setting up AI development files in the current directory...${NC}"

# Check requirements
check_requirements

# 1. Create directories
echo -e "\n1. Creating directories..."
mkdir -p .windsurf/rules .windsurf/output

# 2. Get list of files from GitHub
echo -e "\n2. Fetching file list from GitHub..."
if ! FILES_TO_COPY=$(curl -sSf "$API_URL" | jq -r '.tree[].path' | grep -E '^\.windsurf/'); then
    echo -e "${YELLOW}Error: Failed to fetch file list from GitHub${NC}"
    exit 1
fi

if [ -z "$FILES_TO_COPY" ]; then
    echo -e "${YELLOW}No files found in .windsurf directory${NC}"
    exit 0
fi

# 3. Create a temporary directory for the repo
echo -e "\n3. Downloading repository..."
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

echo "   Downloading from $REPO_URL/archive/refs/heads/main.zip..."
if ! curl -sSLf "$REPO_URL/archive/refs/heads/main.zip" -o "$TMP_DIR/repo.zip"; then
    echo -e "${YELLOW}Error: Failed to download repository${NC}"
    exit 1
fi

echo "   Extracting files..."
if ! unzip -q "$TMP_DIR/repo.zip" -d "$TMP_DIR"; then
    echo -e "${YELLOW}Error: Failed to extract repository${NC}"
    exit 1
fi

REPO_DIR="$TMP_DIR/$(ls "$TMP_DIR" | head -1)"

# 4. Copy files
echo -e "\n4. Copying files..."
echo "$FILES_TO_COPY" | while read -r file; do
    if [ -f "$REPO_DIR/$file" ]; then
        mkdir -p "$(dirname "$file")"
        cp -v "$REPO_DIR/$file" "$file"
    fi
done

# 5. Show final structure
echo -e "\n5. Directory structure created:"
find .windsurf -type f 2>/dev/null | sort

echo -e "\n${GREEN}✓ Setup complete${NC}"