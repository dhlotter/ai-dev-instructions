---
trigger: always_on
---

# Project Workflow Management

Comprehensive guidelines for managing the project workflow from idea inception to implementation.

-------------------------------------------------------------------------------------------
## Directory Structure

```
.windsurf/
├── rules/                      # Workflow rule definitions
│   ├── rule.generate.prd.md    # PRD generation rules
│   ├── rule.generate.tasks.md  # Task generation rules
│   └── rule.planning.md        # Main workflow rules
└── output/                     # Generated files
    ├── {idea-name}-idea.md     # Idea files (e.g., user-auth-idea.md)
    ├── {idea-name}-prd.md     # PRD files (e.g., user-auth-prd.md)
    └── {idea-name}-tasks.md   # Task files (e.g., user-auth-tasks.md)
```

-------------------------------------------------------------------------------------------
## Workflow Triggers

### 1. Idea Creation
**Trigger Phrases:**
- "I have an idea"
- "My idea is..."
- "Create an idea"

**Process:**
1. Create a new markdown file in `.windsurf/output/` with name `{idea-name}-idea.md`
2. Include a clear description of the idea and its purpose

### 2. PRD Generation
**Trigger Phrases:**
- "Create the PRD"
- "Generate PRD"
- "Make product requirements"
- trigger `generate_prd`

**Process:**
1. Locate the idea file in `.windsurf/output/{idea-name}-idea.md`
2. Follow the PRD generation instructions in `.windsurf/rules/rule.generate.prd.md` trigger `generate_prd`
3. Create the PRD as `.windsurf/output/{idea-name}-prd.md`

### 3. Task Generation
**Trigger Phrases:**
- "Create the tasks"
- "Generate tasks"
- "Make task list"
- trigger `generate_tasks`

**Process:**
1. Locate the PRD file in `.windsurf/output/{idea-name}-prd.md`
2. Use the task generation instructions in `.windsurf/rules/rule.generate.tasks.md` trigger `generate_tasks`
3. Create the task file as `.windsurf/output/{idea-name}-tasks.md`

-------------------------------------------------------------------------------------------
## Task Implementation Workflow

### Task Status Management

**Status Indicators:**
- `[ ]` - Not started (default)
- `[-]` - In progress
- `[x]` - Completed
- `[!]` - Blocked (with reason in comment)

**Workflow Rules:**
1. **Starting a Task:**
   - Update status to `[-]`
   - Verify all dependencies are complete
   - Confirm with user before starting

2. **Completing a Task:**
   - Mark as `[x]` when all subtasks are done
   - Update documentation
   - Commit changes with descriptive message

3. **Blocked Tasks:**
   - Mark as `[!]`
   - Add comment explaining the blocker
   - Suggest next steps or alternatives



-------------------------------------------------------------------------------------------
## File Management

### Creating New Files
1. Check `Relevant Files` section in the task file for existing similar files
2. Add entry to `Relevant Files` in the task file with description
3. Create the file with appropriate headers and documentation
4. Update the task file's `Relevant Files` section

### Modifying Files
1. Verify the correct file in `Relevant Files`
2. Make changes incrementally
3. Update `Relevant Files` if purpose changes

-------------------------------------------------------------------------------------------
## User Interaction

### Starting Work
- When user says "start with the tasks" or "start with task X.X":
  1. Locate the specified task
  2. Review task requirements
  3. Confirm with user before starting
  4. Update status to `[-]`

### Task Completion
- When a task is completed:
  1. Mark as `[x]`
  2. Commit changes
  3. Ask user if they want to proceed to next task

### Blocked Tasks
- When encountering a blocker:
  1. Mark as `[!]`
  2. Explain the issue
  3. Suggest possible solutions
  4. Ask for user input

-------------------------------------------------------------------------------------------
## Best Practices

### Code Organization
- Group related functionality
- Keep files focused and modular
- Follow consistent naming conventions
- Maintain clear directory structure

### Code Quality Standards
- Follow existing codebase patterns
- Write clean, self-documenting code
- Include comments for complex logic
- Ensure proper error handling
- Write unit tests for new functionality

### Documentation
- Document all public APIs
- Keep README files updated
- Include usage examples
- Document design decisions

### Testing
- Write tests for new features
- Update tests when modifying existing code
- Ensure adequate test coverage
- Document test cases
   - Follow existing patterns in the codebase
   - Write tests for new functionality
   - Ensure code meets quality standards (e.g., readability, performance, accessibility)

5. **Communication**
   - Provide clear progress updates
   - Flag potential issues early
   - Suggest improvements when appropriate