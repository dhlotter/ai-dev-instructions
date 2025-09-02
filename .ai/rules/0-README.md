# AI Development Rules Directory

This directory contains all the rules, guidelines, and templates for AI-assisted development projects. These files work together to provide a comprehensive framework for consistent, high-quality development across different coding agents.

## File Index

### Core Guidelines
- **[`1-ai-guidelines.md`](1-ai-guidelines.md)** - Primary guidelines for AI assistants
  - Core operating principles and identity
  - Implementation planning and verification
  - Technology stack and integration guidelines
  - Quality management and error handling protocols
  - *Use this as your main reference for AI behavior and development standards*

### Technology & Setup
- **[`2-tech-stack.md`](2-tech-stack.md)** - Technology stack and development rules
  - Primary and alternative tech stacks
  - Development workflow rules
  - Tool usage guidelines
  - Project structure conventions
  - *Read this first when starting a new project*

### Workflow Management
- **[`3-workflow.md`](3-workflow.md)** - Project workflow and task management
  - Directory structure for organized development
  - Workflow triggers and processes
  - Task status management and file handling
  - User interaction guidelines
  - *Follow this for managing project phases and tasks*

### Templates & Generation
Templates are available in the `.ai/templates/` directory:
- `prd-template.md` - Product Requirements Document template
- `simple-file-registry-template.md` - File registry template (one line per file)

### File Registry Management
**File Registry System:**
- Maintain a file registry for each project in `.ai/work/{project}-file-registry.md`
- Use the `simple-file-registry-template.md` for concise documentation (one line per file)
- Update the registry whenever new files are created or existing files are significantly modified
- Check the registry before creating new files to avoid duplicates
- Document file purposes, dependencies, and relationships

**Registry Template Usage:**
1. Copy `simple-file-registry-template.md` to `.ai/work/{project}-file-registry.md`
2. Replace placeholders with project-specific information
3. Add one line per file with its purpose and key relationships
4. Update regularly during development

Task management is handled by Kilo Code's internal task system

### Component Management
Component tracking is handled in the project work files (see `.ai/work/shadcn-components.md`)

### Reference Materials
- Use the main templates above for all planning needs
- Additional reference materials can be added here as needed

## Usage Workflow

1. **Project Start**: Read [`2-tech-stack.md`](2-tech-stack.md) to understand available technologies
2. **AI Setup**: Review [`1-ai-guidelines.md`](1-ai-guidelines.md) for operating principles
3. **Idea Development**: Use [`3-workflow.md`](3-workflow.md) for organizing project phases
4. **Requirements**: Use [`.ai/templates/prd-template.md`](templates/prd-template.md) to document feature requirements
5. **File Registry Setup**: Create `.ai/work/{project}-file-registry.md` using `simple-file-registry-template.md`
6. **Task Planning**: Use Kilo Code's internal task management system
7. **Implementation**: Follow guidelines in [`1-ai-guidelines.md`](1-ai-guidelines.md) and [`2-tech-stack.md`](2-tech-stack.md)
   - **Check file registry** before creating new files to avoid duplicates
   - **Update file registry** immediately when adding/modifying files
   - **Document relationships** and dependencies for each new file
8. **Component Work**: Reference [`.ai/work/shadcn-components.md`](work/shadcn-components.md) for UI components

## File Maintenance

- Keep all files updated as technologies and processes evolve
- Add new guidelines to the most appropriate existing file
- Create new files only when a distinct new category is needed
- Ensure cross-references between files remain accurate

## Agent Compatibility

These rules are designed to work across multiple coding agents:
- **Windsurf**: Full compatibility with MCP tools and workflows
- **Kilo Code**: Compatible with MCP configurations
- **RooCode**: Works with standard tool formatting
- **Cline**: Compatible with appropriate tool usage

For agent-specific configurations, see `.ai/configs/mcp.json`.