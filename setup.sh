#!/bin/bash

REPO_URL="https://raw.githubusercontent.com/dhlotter/ai-dev-instructions/main"

# If no project name is provided, use the current directory
if [ -z "$1" ]; then
  TARGET_DIR="."
  echo "Setting up AI development files in the current directory..."
else
  PROJECT_NAME="$1"
  # Check if the project directory already exists
  if [ -d "$PROJECT_NAME" ]; then
    echo "Error: Directory '$PROJECT_NAME' already exists."
    exit 1
  fi
  # Create the new project directory
  echo "Creating project directory: $PROJECT_NAME"
  mkdir -p "$PROJECT_NAME"
  TARGET_DIR="$PROJECT_NAME"
fi

# Function to download a directory from GitHub
# Usage: download_dir <target_dir> <source_dir>
download_dir() {
  local target_dir="$1"
  local source_dir="$2"
  
  # Create the target directory
  mkdir -p "$target_dir"
  
  # Get the list of files in the source directory from GitHub
  local files=()
  if [ "$source_dir" == ".ai" ]; then
    # Hardcode the files for .ai since we can't list the directory
    files=(
      "$REPO_URL/.ai/1.ideas/global.md"
      "$REPO_URL/.ai/2.prd/.generate-prd.md"
      "$REPO_URL/.ai/3.tasks/.generate-tasks.md"
      "$REPO_URL/.ai/3.tasks/relevant-files.md"
      "$REPO_URL/.ai/rule.task.md"
    )
  elif [ "$source_dir" == ".windsurf" ]; then
    # Create an empty .windsurf/rules directory
    mkdir -p "$target_dir/rules"
    touch "$target_dir/rules/default.md"
    return 0
  fi
  
  # Download each file
  for file_url in "${files[@]}"; do
    # Extract the relative path from the URL
    local rel_path="${file_url#$REPO_URL/}"
    local target_path="$target_dir/${rel_path#.ai/}"
    
    # Create the directory structure
    mkdir -p "$(dirname "$target_path")"
    
    # Download the file
    echo "Downloading $rel_path..."
    if ! curl -sSL "$file_url" -o "$target_path"; then
      echo "Warning: Failed to download $file_url"
    fi
  done
}

# Download the .ai and .windsurf directories
echo "Downloading framework files..."
download_dir "$TARGET_DIR/.ai" ".ai"
download_dir "$TARGET_DIR/.windsurf" ".windsurf"

if [ "$TARGET_DIR" != "." ]; then
  echo "Project '$TARGET_DIR' created successfully."
else
  echo "AI development files have been set up in the current directory."
fi
