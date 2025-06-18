#!/bin/bash

# Check if a project name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <project-name>"
  exit 1
fi

PROJECT_NAME=$1

# Check if the project directory already exists
if [ -d "$PROJECT_NAME" ]; then
  echo "Error: Directory '$PROJECT_NAME' already exists."
  exit 1
fi

# Create the new project directory
echo "Creating project directory: $PROJECT_NAME"
mkdir "$PROJECT_NAME"

# Copy the .ai and .windsurf directories
echo "Copying framework files..."
cp -r ./.ai "$PROJECT_NAME/"
cp -r ./.windsurf "$PROJECT_NAME/"

echo "Project '$PROJECT_NAME' created successfully."
