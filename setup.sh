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

# Create basic directory structure
mkdir -p ".ai/1.ideas"
mkdir -p ".ai/2.prd"
mkdir -p ".ai/3.tasks"
mkdir -p ".windsurf/rules"

# Get list of all files in the repository
echo "Fetching repository file list..."
FILES=$(list_repo_files)
if [ -z "$FILES" ]; then
  echo "Error: Failed to list repository files."
  exit 1
fi

# Show debug info
echo "Files found in repository:"
echo "$FILES" | grep -E "^(\.ai|\.windsurf)"

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
  
  # Skip .DS_Store files
  if [[ "$file" == *".DS_Store" ]]; then
    continue
  fi
  
  # Download the file
  download_file "$file" "$file"
done

# Create default files if they don't exist
if [ ! -f ".ai/1.ideas/idea.md" ]; then
  echo "Creating default idea file..."
  echo "# Project Ideas\n\nAdd your project ideas here." > ".ai/1.ideas/idea.md"
fi

if [ ! -f ".ai/2.prd/.generate-prd.md" ]; then
  echo "Creating default PRD template..."
  echo "# PRD Template\n\nUse this template to create your Product Requirements Document." > ".ai/2.prd/.generate-prd.md"
fi

if [ ! -f ".ai/3.tasks/.generate-tasks.md" ]; then
  echo "Creating default tasks template..."
  echo "# Task Generation\n\nUse this template to generate tasks from your PRD." > ".ai/3.tasks/.generate-tasks.md"
fi

if [ ! -f ".ai/3.tasks/relevant-files.md" ]; then
  echo "Creating relevant-files.md..."
  echo "## Relevant Files\n\n" > ".ai/3.tasks/relevant-files.md"
fi

if [ ! -f ".ai/rule.task.md" ]; then
  echo "Creating rule.task.md..."
  cat > ".ai/rule.task.md" << 'EOL'
---
trigger: always_on
---

# Project Workflow Management

Guidelines for managing the project workflow from ideas to implementation

## Workflow Overview

1. **Ideation Phase**
   - Create idea files in `.ai/1.ideas/`
   - Naming: `idea-[short-description].md`
   - Include problem statement, goals, and initial thoughts

2. **PRD Creation**
   - For each idea, create a PRD in `.ai/2.prd/`
   - Global PRD: `prd-global.md` (overall project)
   - Feature PRDs: `prd-feature-[name].md`
   - Use template from `.ai/2.prd/.generate-prd.md`

3. **Task Generation**
   - Generate tasks from PRD using `.ai/3.tasks/0.generate-tasks.md`
   - Task list naming: `tasks-[prd-name].md`
   - Store in `.ai/3.tasks/`
   - Maintain `relevant-files.md` for context

## Task Implementation

- **One sub-task at a time:** Do **NOT** start the next sub‑task without user confirmation
- **Completion protocol:**  
  1. Mark completed sub‑tasks with `[x]`
  2. Mark parent task `[x]` when all sub‑tasks are complete  
- Wait for user confirmation before proceeding to next task

## File Management

1. **Relevant Files**
   - Maintain `.ai/3.tasks/relevant-files.md`
   - List all created/modified files with one-line descriptions
   - Use flat structure with functional names (e.g., `login-form.tsx`)
   - Group related files with headers (e.g., `## Frontend Components`)

2. **Version Control**
   - Commit after completing each sub-task
   - Use descriptive commit messages
   - Reference task numbers in commit messages

## AI Instructions

1. **Task Execution**
   - Always check `relevant-files.md` for context
   - Follow the task list order strictly
   - Ask for clarification if requirements are unclear

2. **Documentation**
   - Update `relevant-files.md` with changes
   - Add comments explaining complex logic
   - Document any assumptions or decisions made

3. **Code Quality**
   - Follow existing patterns in the codebase
   - Write tests for new functionality
   - Ensure responsive and accessible UI components

4. **Communication**
   - Provide clear progress updates
   - Flag potential issues early
   - Suggest improvements when appropriate
EOL
fi

# Ensure the .windsurf/rules directory exists with at least one file
if [ ! -f ".windsurf/rules/rule.task.md" ]; then
  echo "Creating default rules file..."
  cp ".ai/rule.task.md" ".windsurf/rules/rule.task.md" 2>/dev/null || echo "" > ".windsurf/rules/rule.task.md"
fi

echo "AI development files have been set up in the current directory."
echo "Directory structure:"
find .ai .windsurf -type f | sort
