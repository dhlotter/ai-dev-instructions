#!/bin/bash

GITHUB_REPO="dhlotter/ai-dev-instructions"
BRANCH="main"
REPO_URL="https://raw.githubusercontent.com/$GITHUB_REPO/$BRANCH"
API_URL="https://api.github.com/repos/$GITHUB_REPO/git/trees/$BRANCH?recursive=1"

# Always use the current directory
TARGET_DIR="."
echo "Setting up AI development files in the current directory..."

# Function to recursively download files from GitHub
download_files() {
  local prefix="$1"
  local target_dir="$2"
  
  echo "Fetching repository structure..."
  # Get the repository structure using GitHub's API
  local repo_data
  repo_data=$(curl -sSL "$API_URL")
  
  if [ -z "$repo_data" ]; then
    echo "Error: Failed to fetch repository structure."
    exit 1
  fi
  
  # Extract paths that start with the specified prefix
  echo "Processing files..."
  local paths
  paths=$(echo "$repo_data" | grep -o '"path":"'"$prefix"'[^"]*"' | sed 's/"path":"//g' | sed 's/"//g')
  
  if [ -z "$paths" ]; then
    echo "Warning: No files found with prefix '$prefix'."
    return 0
  fi
  
  # Download each file
  echo "$paths" | while read -r path; do
    # Skip if this is a directory (ends with /)
    if [[ "$path" == */ ]]; then
      continue
    fi
    
    # Extract the relative path from the prefix
    local rel_path="${path#$prefix/}"
    local target_path="$target_dir/$rel_path"
    
    # Create the directory structure
    mkdir -p "$(dirname "$target_path")"
    
    # Download the file
    echo "Downloading $path..."
    if ! curl -sSL "$REPO_URL/$path" -o "$target_path"; then
      echo "Warning: Failed to download $path"
    fi
  done
}

# Download the .ai and .windsurf directories
echo "Downloading framework files..."

# Create target directories
mkdir -p "$TARGET_DIR/.ai"
mkdir -p "$TARGET_DIR/.windsurf/rules"

# Download .ai files
download_files ".ai" "$TARGET_DIR/.ai"

# Download .windsurf files
download_files ".windsurf" "$TARGET_DIR/.windsurf"

# If .windsurf directory is empty, create a default file
if [ ! "$(ls -A "$TARGET_DIR/.windsurf/rules" 2>/dev/null)" ]; then
  echo "Creating default rules file..."
  mkdir -p "$TARGET_DIR/.windsurf/rules"
  touch "$TARGET_DIR/.windsurf/rules/default.md"
fi

echo "AI development files have been set up in the current directory."
