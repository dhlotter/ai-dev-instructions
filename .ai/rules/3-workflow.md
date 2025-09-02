---
trigger: always_on
---

# Project Workflow Management

Guidelines for managing the project workflow from idea inception to implementation.

## Directory Structure

```
.ai/
├── configs/                    # Configuration files
│   └── mcp.json               # MCP server configurations
├── templates/                  # Reusable templates
│   ├── prd-template.md         # PRD template
│   └── simple-file-registry-template.md  # File registry (one line per file)
├── rules/                      # Rule definitions
│   ├── 0-README.md            # Directory index
│   ├── 1-ai-guidelines.md     # AI assistant guidelines
│   ├── 2-tech-stack.md        # Technology stack
│   ├── 3-workflow.md          # Workflow management
└── work/                      # All project files
    ├── shadcn-components.md   # Component tracking
    ├── {project}-idea.md      # Idea documentation
    ├── {project}-prd.md       # PRD documentation
    ├── {project}-tasks.md     # Task tracking (Kilo Code)
    └── {project}-file-registry.md  # File registry (one line per file)
```

## Workflow Triggers

### 1. Idea Creation
**Trigger Phrases:**
- "I have an idea"
- "My idea is..."
- "Create an idea"

**Process:**
1. Create a new markdown file in `.ai/work/` with name `{project}-idea.md`
2. Include a clear description of the idea and its purpose

### 2. PRD Generation
**Trigger Phrases:**
- "Create the PRD"
- "Generate PRD"
- "Make product requirements"

**Process:**
1. Locate the idea file in `.ai/work/{project}-idea.md`
2. Use the PRD template from [`.ai/templates/prd-template.md`](templates/prd-template.md)
3. Create the PRD as `.ai/work/{project}-prd.md`

### 3. Task Management
**Trigger Phrases:**
- "Create tasks"
- "Generate task list"
- "Set up project tasks"

**Process:**
1. Use internal task system for project management
2. Create task file as `.ai/work/{project}-tasks.md` for reference
3. Create file registry as `.ai/work/{project}-file-registry.md` using `simple-file-registry-template.md`
4. Reference the generated PRD for requirements
5. Follow the guidelines in [1-ai-guidelines.md](1-ai-guidelines.md) and [2-tech-stack.md](2-tech-stack.md)

### 4. Implementation
**Trigger Phrases:**
- "Start implementing"
- "Begin development"
- "Let's build this"

**Process:**
1. Use Kilo Code's internal task system for project management
2. Reference the generated PRD for requirements
3. Follow the guidelines in [1-ai-guidelines.md](1-ai-guidelines.md) and [2-tech-stack.md](2-tech-stack.md)

## Integration with Kilo Code

Since this framework integrates with Kilo Code's internal task management system:

- **Task Creation**: Use Kilo Code's native task creation features
- **Task Tracking**: Rely on Kilo Code's built-in progress tracking
- **Status Updates**: Use Kilo Code's task status management
- **Dependencies**: Leverage Kilo Code's dependency management

## Communication Guidelines
- Provide clear progress updates during implementation
- Flag potential issues early
- Confirm with user before starting major work streams
- Ask for clarification when requirements are unclear