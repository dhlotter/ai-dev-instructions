#!/bin/bash

GITHUB_REPO="dhlotter/ai-dev-instructions"
REPO_URL="https://github.com/$GITHUB_REPO.git"

echo "Setting up AI development files in the current directory..."

# Create a temporary directory
TMP_DIR=$(mktemp -d)
if [ $? -ne 0 ]; then
  echo "Error: Failed to create temporary directory."
  exit 1
fi

# Make sure temporary directory is cleaned up on exit
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

# Clone the repository to the temporary directory
echo "Cloning repository..."
if ! git clone --quiet "$REPO_URL" "$TMP_DIR"; then
  echo "Error: Failed to clone repository."
  exit 1
fi

# Copy the .ai directory
if [ -d "$TMP_DIR/.ai" ]; then
  echo "Copying .ai directory..."
  mkdir -p ".ai"
  cp -R "$TMP_DIR/.ai"/* ".ai/"
fi

# Copy the .windsurf directory
if [ -d "$TMP_DIR/.windsurf" ]; then
  echo "Copying .windsurf directory..."
  mkdir -p ".windsurf"
  cp -R "$TMP_DIR/.windsurf"/* ".windsurf/"
fi

# Ensure the .windsurf/rules directory exists with at least one file
if [ ! -d ".windsurf/rules" ] || [ ! "$(ls -A ".windsurf/rules" 2>/dev/null)" ]; then
  echo "Creating default rules file..."
  mkdir -p ".windsurf/rules"
  touch ".windsurf/rules/default.md"
fi

echo "AI development files have been set up in the current directory."
