#!/bin/bash

GITHUB_REPO="dhlotter/ai-dev-instructions"
BRANCH="main"
ARCHIVE_URL="https://github.com/$GITHUB_REPO/archive/$BRANCH.zip"

echo "Setting up AI development files in the current directory..."

# Create standard directory structure first
echo "Creating standard directory structure..."
mkdir -p .ai/1.ideas
mkdir -p .ai/2.prd
mkdir -p .ai/3.tasks
mkdir -p .ai/3.work
mkdir -p .windsurf/rules

# Create a temporary directory
TMP_DIR=$(mktemp -d)
if [ $? -ne 0 ]; then
  echo "Error: Failed to create temporary directory."
  exit 1
fi

# Clean up temporary directory on exit
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

# Download the repository archive
echo "Downloading repository archive..."
if ! curl -sSL "$ARCHIVE_URL" -o "$TMP_DIR/repo.zip"; then
  echo "Error: Failed to download repository archive."
  exit 1
fi

# Extract the archive
echo "Extracting files..."
if ! unzip -q "$TMP_DIR/repo.zip" -d "$TMP_DIR"; then
  echo "Error: Failed to extract repository archive."
  exit 1
fi

# Find the extracted directory
EXTRACT_DIR=$(find "$TMP_DIR" -maxdepth 1 -type d -name "ai-dev-instructions*" | head -n 1)
if [ -z "$EXTRACT_DIR" ] || [ ! -d "$EXTRACT_DIR" ]; then
  echo "Error: Extracted directory not found."
  exit 1
fi

# Copy files from the repository if they exist
echo "Copying AI development files..."

# Copy .ai directory
if [ -d "$EXTRACT_DIR/.ai" ]; then
  echo "Copying .ai directory..."
  cp -R "$EXTRACT_DIR/.ai/"* .ai/ 2>/dev/null || true
fi

# Copy .windsurf directory
if [ -d "$EXTRACT_DIR/.windsurf" ]; then
  echo "Copying .windsurf directory..."
  cp -R "$EXTRACT_DIR/.windsurf/"* .windsurf/ 2>/dev/null || true
fi

echo "AI development files have been set up in the current directory."
echo "Directory structure:"
find .ai .windsurf -type d -o -type f 2>/dev/null | sort || echo "No files or directories found."
