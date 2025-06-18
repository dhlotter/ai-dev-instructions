---
trigger: always_on
---

# Project Workflow Management

Guidelines for managing the project workflow from ideas to implementation

## Workflow Triggers

1. **Idea Creation**
   - When user says "my idea is: [idea text]":
     1. Create a new file in `.ai/1.ideas/` with name `idea-{timestamp}.md`
     2. Format the idea with a title and the provided description
     3. Include creation timestamp and status: `Status: New`

2. **PRD Generation**
   - When user says "create the prd":
     1. Look for the most recent file in `.ai/1.ideas/`
     2. Use the template from `.ai/2.prd/.generate-prd.md`
     3. Create a PRD in `.ai/2.prd/` with name `prd-{idea-name}.md`
     4. Include sections for:
        - Overview
        - Features
        - Requirements
        - Technical Specifications

3. **Task Generation**
   - When user says "create the tasks":
     1. Find the most recent PRD in `.ai/2.prd/`
     2. Use the rules from [.ai/3.work/.generate-tasks.md](.ai/3.work/.generate-tasks.md)
     3. Create a task file in `.ai/3.tasks/` with name `tasks-{prd-name}.md`
     4. Include:
        - Parent tasks for major components
        - Sub-tasks for implementation details
        - Testing tasks
        - Documentation updates

## Task Implementation

### Task Status Management

- **Task States:**
  - `[ ]` - Not started (default state for new tasks)
  - `[-]` - In progress
  - `[x]` - Completed

- **Automatic Status Updates:**
  1. When starting work on a task, update its status to `[-]`
  2. When a task is completed, update its status to `[x]`
  3. When all sub-tasks of a parent task are completed, mark the parent task as `[x]`

- **Workflow Rules:**
  - One sub-task at a time: Do NOT start the next sub-task without user confirmation
  - Wait for user confirmation before proceeding to next task
  - Update task status immediately when state changes
  - If a task is blocked, add `[!]` and describe the blocker in a comment

## File Management

1. **Relevant Files**
   - Maintain `.ai/3.tasks/relevant-files.md` to track all project files
   - File location: `.ai/3.tasks/relevant-files.md`
   - List all created/modified files with one-line descriptions
   - Use clear, functional names (e.g., `login-form.tsx`)
   - Group related files with headers (e.g., `## Frontend Components`)
   - Update this file immediately when creating, modifying, or deleting files

2. **Version Control**
   - Commit after completing each sub-task
   - Use descriptive commit messages
   - Reference task numbers in commit messages
   - Include updates to [relevant-files.md](.ai/3.work/relevant-files.md) in the same commit as the related file changes

## AI Instructions

1. **Task Execution**
   - Always check `.ai/3.tasks/relevant-files.md` for context before starting work
   - Follow the task list order strictly
   - Ask for clarification if requirements are unclear
   - Update task status automatically when starting or completing work

2. **File Management**
   - When creating new files:
     1. Add entry to `.ai/3.tasks/relevant-files.md` first
     2. Create the actual file
     3. Include a comment at the top of the file with a brief description
   - When modifying files:
     1. Update the relevant entry in `.ai/3.tasks/relevant-files.md` if the file's purpose changes
   - When deleting files:
     1. Remove the entry from `.ai/3.tasks/relevant-files.md`
     2. Delete the file

3. **Documentation**
   - Update [relevant-files.md](.ai/3.work/relevant-files.md) with changes
   - Add comments explaining complex logic
   - Document any assumptions or decisions made

4. **Code Quality**
   - Follow existing patterns in the codebase
   - Write tests for new functionality
   - Ensure code meets quality standards (e.g., readability, performance, accessibility)

5. **Communication**
   - Provide clear progress updates
   - Flag potential issues early
   - Suggest improvements when appropriate