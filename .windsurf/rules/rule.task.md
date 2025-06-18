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
   - Create idea files in `.work/1.ideas/`
   - Naming: `idea-[short-description].md`
   - Include problem statement, goals, and initial thoughts

2. **PRD Creation**
   - For each idea, create a PRD in `.work/2.prd/`
   - Global PRD: `prd-global.md` (overall project)
   - Feature PRDs: `prd-feature-[name].md`
   - Use template from `.work/2.prd/.generate-prd.md`

3. **Task Generation**
   - Generate tasks from PRD using `.work/3.tasks/0.generate-tasks.md`
   - Task list naming: `tasks-[prd-name].md`
   - Store in `.work/3.tasks/`
   - Maintain `relevant-files.md` for context

## Task Implementation

- **One sub-task at a time:** Do **NOT** start the next sub‑task without user confirmation
- **Completion protocol:**  
  1. Mark completed sub‑tasks with `[x]`
  2. Mark parent task `[x]` when all sub‑tasks are complete  
- Wait for user confirmation before proceeding to next task

## File Management

1. **Relevant Files**
   - Maintain `.work/3.tasks/relevant-files.md`
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