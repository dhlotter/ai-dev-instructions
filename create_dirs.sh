#!/bin/bash

GITHUB_REPO="dhlotter/ai-dev-instructions"
BRANCH="main"
ARCHIVE_URL="https://github.com/$GITHUB_REPO/archive/$BRANCH.zip"

echo "Setting up AI development files in the current directory..."

# Create all required directories
echo "Creating directory structure..."
mkdir -p ".ai/1.ideas"
mkdir -p ".ai/2.prd"
mkdir -p ".ai/3.tasks"
mkdir -p ".windsurf/rules"

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
echo "Downloading repository files..."
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

# Function to copy files from source to destination
copy_files() {
  local src="$1"
  local dest="$2"
  
  if [ -d "$src" ] && [ "$(ls -A "$src" 2>/dev/null)" ]; then
    echo "Copying files to $dest..."
    mkdir -p "$dest"
    cp -R "$src/"* "$dest/" 2>/dev/null || true
  fi
}

# Copy files from repository
echo "Copying files..."

# Copy .ai subdirectories
for dir in "1.ideas" "2.prd" "3.tasks"; do
  src_dir="$EXTRACT_DIR/.ai/$dir"
  dest_dir=".ai/$dir"
  copy_files "$src_dir" "$dest_dir"
done

# Copy .windsurf/rules directory
copy_files "$EXTRACT_DIR/.windsurf/rules" ".windsurf/rules"

# Show final directory structure
echo "\nDirectory structure created:"
find .ai .windsurf -type d -o -type f 2>/dev/null | sort | grep -v "\.git"

echo "\n✓ Setup complete"
