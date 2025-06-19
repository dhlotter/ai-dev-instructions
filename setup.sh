#!/bin/bash

GITHUB_REPO="dhlotter/ai-dev-instructions"
BRANCH="main"
ARCHIVE_URL="https://github.com/$GITHUB_REPO/archive/$BRANCH.zip"

echo "Setting up AI development files in the current directory..."

# Create standard directory structure
echo "Creating standard directory structure..."
# Create all required directories
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

# Function to copy files from source to destination, preserving directory structure
copy_files() {
  local src="$1"
  local dest="$2"
  
  if [ -d "$src" ]; then
    # Create destination directory if it doesn't exist
    mkdir -p "$dest"
    
    # Copy all files and directories, preserving structure
    if command -v rsync &> /dev/null; then
      rsync -a "$src/" "$dest/"
    else
      find "$src" -type f -exec sh -c '
        dest="$1/$(dirname "${2#$3}")"
        mkdir -p "$dest"
        cp "$2" "$dest/"
      ' _ "$dest" {} "$src" \;
    fi
  fi
}

# Copy files from the repository
echo "Copying AI development files..."

# Copy .ai subdirectories
for dir in "1.ideas" "2.prd" "3.tasks"; do
  src_dir="$EXTRACT_DIR/.ai/$dir"
  if [ -d "$src_dir" ] && [ "$(ls -A "$src_dir" 2>/dev/null)" ]; then
    echo "Copying .ai/$dir files..."
    mkdir -p ".ai/$dir"
    cp -R "$src_dir/"* ".ai/$dir/" 2>/dev/null || true
  fi
done

# Copy .windsurf/rules directory
windsurf_src="$EXTRACT_DIR/.windsurf/rules"
if [ -d "$windsurf_src" ] && [ "$(ls -A "$windsurf_src" 2>/dev/null)" ]; then
  echo "Copying .windsurf/rules files..."
  mkdir -p ".windsurf/rules"
  cp -R "$windsurf_src/"* ".windsurf/rules/" 2>/dev/null || true
fi

echo "AI development files have been set up in the current directory."
echo "Directory structure:"
find .ai .windsurf -type d -o -type f 2>/dev/null | sort || echo "No files or directories found."
