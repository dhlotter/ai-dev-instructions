#!/bin/bash

GITHUB_REPO="dhlotter/ai-dev-instructions"
BRANCH="main"
ARCHIVE_URL="https://github.com/$GITHUB_REPO/archive/refs/heads/$BRANCH.zip"

echo "Setting up AI development files in the current directory..."

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

# Get the extracted directory name
EXTRACT_DIR="$TMP_DIR/ai-dev-instructions-$BRANCH"
if [ ! -d "$EXTRACT_DIR" ]; then
  echo "Error: Extracted directory not found."
  exit 1
fi

# Copy .ai and .windsurf directories
echo "Copying AI development files..."
for dir in ".ai" ".windsurf"; do
  if [ -d "$EXTRACT_DIR/$dir" ]; then
    cp -R "$EXTRACT_DIR/$dir" .
    echo "Copied $dir directory."
  fi
done

echo "AI development files have been set up in the current directory."
echo "Directory structure:"
find .ai .windsurf -type f 2>/dev/null | sort
