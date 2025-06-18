#!/bin/bash

GITHUB_REPO="dhlotter/ai-dev-instructions"
GITHUB_API="https://api.github.com/repos/$GITHUB_REPO"
RAW_CONTENT="https://raw.githubusercontent.com/$GITHUB_REPO/main"

echo "Setting up AI development files in the current directory..."

# Function to download a file from GitHub
download_file() {
  local file_path="$1"
  local target_path="$2"
  
  # Create directory structure
  mkdir -p "$(dirname "$target_path")"
  
  # Download the file
  echo "Downloading $file_path"
  if ! curl -sSL "$RAW_CONTENT/$file_path" -o "$target_path"; then
    echo "Warning: Failed to download $file_path"
    return 1
  fi
  return 0
}

# Function to list all files in the repository
list_repo_files() {
  # Get the repository contents using GitHub API
  echo "Fetching repository file list..."
  curl -sSL "$GITHUB_API/git/trees/main?recursive=1" | grep -o '"path":"[^"]*"' | sed 's/"path":"//g' | sed 's/"//g'
}

# Get list of all files in the repository
FILES=$(list_repo_files)
if [ -z "$FILES" ]; then
  echo "Error: Failed to list repository files."
  exit 1
fi

# Download each file
echo "Downloading files..."
for file in $FILES; do
  # Skip .git files and directories
  if [[ "$file" == .git* ]]; then
    continue
  fi
  
  # Skip files that are not in .ai or .windsurf directories
  if [[ "$file" != .ai* ]] && [[ "$file" != .windsurf* ]]; then
    continue
  fi
  
  # Download the file
  download_file "$file" "$file"
done

# Ensure the .windsurf/rules directory exists with at least one file
if [ ! -d ".windsurf/rules" ] || [ ! "$(ls -A ".windsurf/rules" 2>/dev/null)" ]; then
  echo "Creating default rules file..."
  mkdir -p ".windsurf/rules"
  touch ".windsurf/rules/default.md"
fi

echo "AI development files have been set up in the current directory."
