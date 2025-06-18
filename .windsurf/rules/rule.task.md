---
trigger: always_on
---

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
   - Generate tasks from PRD using `.ai/3.tasks/.generate-tasks.md`
   - Task list naming: `tasks-[prd-name].md`
   - Store in `.ai/3.tasks/`
   - Maintain `.ai/3.tasks/relevant-files.md` for context

## Task Implementation

### Task Status Management

- **Task States:**
  - `[ ]` - Not started (default state for new tasks)
  - `[-]` - In progress
  - `[x]` - Completed
  - `[!]` - Blocked

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
   - Include updates to [relevant-files.md](cci:7://file:///Users/dhlotter/Downloads/sourcecontrol/projects/ai-dev-instructions/.ai/3.work/relevant-files.md:0:0-0:0) in the same commit as the related file changes

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
   - When modifying files:
     1. Update the relevant entry in `.ai/3.tasks/relevant-files.md` if the file's purpose changes
   - When deleting files:
     1. Remove the entry from `.ai/3.tasks/relevant-files.md`
     2. Delete the file

3. **Documentation**
   - Update [relevant-files.md](cci:7://file:///Users/dhlotter/Downloads/sourcecontrol/projects/ai-dev-instructions/.ai/3.work/relevant-files.md:0:0-0:0) with changes
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