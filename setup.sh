#!/bin/bash

GITHUB_REPO="dhlotter/ai-dev-instructions"
BRANCH="main"
ARCHIVE_URL="https://github.com/$GITHUB_REPO/archive/$BRANCH.zip"

echo "Setting up AI development files in the current directory..."

# Check for required commands
for cmd in curl unzip; do
  if ! command -v $cmd &> /dev/null; then
    echo "Error: $cmd is required but not installed."
    exit 1
  fi
done

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

# Find the extracted directory name (in case branch name changes)
EXTRACT_DIR=$(find "$TMP_DIR" -maxdepth 1 -type d -name "ai-dev-instructions*" | head -n 1)
if [ -z "$EXTRACT_DIR" ] || [ ! -d "$EXTRACT_DIR" ]; then
  echo "Error: Extracted directory not found."
  exit 1
fi

# Copy .ai and .windsurf directories
echo "Copying AI development files..."
for dir in ".ai" ".windsurf"; do
  if [ -d "$EXTRACT_DIR/$dir" ]; then
    echo "Copying $dir directory..."
    # Create the target directory structure first
    mkdir -p "$dir"
    # Use rsync if available for better directory handling, fallback to find + cp
    if command -v rsync &> /dev/null; then
      rsync -a --include='*/' --include='.gitkeep' --exclude='*' "$EXTRACT_DIR/$dir/" "./$dir/" 2>/dev/null || true
      rsync -a "$EXTRACT_DIR/$dir/" "./$dir/"
    else
      # Fallback method using find and cp
      (cd "$EXTRACT_DIR" && find "$dir" -type d -exec mkdir -p -- "../$dir/{}" \; 2>/dev/null || true)
      (cd "$EXTRACT_DIR" && find "$dir" -type f -exec cp --preserve=all "{}" "../{}" \; 2>/dev/null || true)
    fi
  else
    echo "Warning: $dir directory not found in the repository."
  fi
done

echo "AI development files have been set up in the current directory."
echo "Directory structure:"
find .ai .windsurf -type f 2>/dev/null | sort || echo "No files found."
