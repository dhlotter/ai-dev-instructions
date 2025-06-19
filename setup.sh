#!/bin/bash

GITHUB_REPO="dhlotter/ai-dev-instructions"
API_URL="https://api.github.com/repos/$GITHUB_REPO/git/trees/HEAD?recursive=1"

echo "Setting up AI development files in the current directory..."

# 1. Create directories
echo "1. Creating directories..."
mkdir -p .ai/1.ideas .ai/2.prd .ai/3.tasks .windsurf/rules

# 2. Get list of files from GitHub
echo "2. Fetching file list from GitHub..."
FILES_TO_COPY=$(curl -s "$API_URL" | jq -r '.tree[].path' | grep -E '^\.(ai|windsurf)/')

if [ -z "$FILES_TO_COPY" ]; then
  echo "   No files found in .ai or .windsurf directories"
  exit 0
fi

# 3. Create a temporary directory for the repo
echo "3. Downloading repository..."
TMP_DIR=$(mktemp -d)
curl -sL "https://github.com/$GITHUB_REPO/archive/refs/heads/main.zip" -o "$TMP_DIR/repo.zip"
unzip -q "$TMP_DIR/repo.zip" -d "$TMP_DIR"
REPO_DIR="$TMP_DIR/$(ls "$TMP_DIR" | head -1)"

# 4. Copy files
echo "4. Copying files..."
echo "$FILES_TO_COPY" | while read -r file; do
  if [ -f "$REPO_DIR/$file" ]; then
    mkdir -p "$(dirname "$file")"
    cp -v "$REPO_DIR/$file" "$file"
  fi
done

# 5. Show final structure
echo -e "\n5. Directory structure created:"
find .ai .windsurf -type f 2>/dev/null | sort

echo -e "\n✓ Setup complete"
