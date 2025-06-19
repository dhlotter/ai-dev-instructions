---
trigger: generate_tasks
---

# PRD Task Generation Rule for Windsurf IDE

## Goal
Automatically generate a structured markdown file from a Product Requirements Document (PRD), listing relevant files and tasks necessary for implementing features.

## Output
- **Filename:** `.ai/tasks-[idea-name].md` (e.g., `tasks-auth-system.md`)

---

## Structure of Generated Markdown

### 1. Relevant Files
This section lists all files that should be created or modified during the project. Each entry must:
- Clearly indicate the relative file path.
- Include a brief description explaining its purpose.
- Enable Windsurf IDE to identify if files exist or if they need creation.

**Example:**

```markdown
## Relevant Files

- `src/components/Login.tsx` - Main component for user login interface.
- `src/api/auth.ts` - API handler for authentication requests.
- `tests/components/Login.test.tsx` - Unit tests for the Login component.
```

### 2. Tasks
List tasks in an organized, hierarchical format. Create up to **12 main tasks**, each potentially having up to **5 sub-tasks**. Tasks should be actionable, clearly defined, and achievable.

**Task Format:**

```markdown
## Tasks

- [ ] 1.0 Main Task Title
  - [ ] 1.1 Sub-task description
  - [ ] 1.2 Sub-task description
- [ ] 2.0 Main Task Title
  - [ ] 2.1 Sub-task description
```

---

## Task Generation Process

1. **Analyze PRD**
   - Input PRD from `.ai/prd-{idea-name}.md`
   - Validate completeness and clarity

2. **Identify Key Components**
   - Determine main components and features from the PRD

3. **File Mapping**
   - Identify necessary files by functionality
   - Organize files by frontend, backend, and test categories

4. **Task Breakdown**
   - Create high-level tasks (up to 12)
   - Clearly describe sub-tasks (up to 5 per main task)

---

## Best Practices

- **Atomic Tasks:** Each sub-task should take 2-4 hours.
- **Dependencies:** Explicitly note and manage task dependencies.
- **Estimation:** Provide clear and realistic time estimates.
- **Acceptance Criteria:** Clearly define completion criteria aligned with PRD.
- **Technical Debt:** Clearly document any trade-offs or necessary refactors.
- **Future-Proof Development:** Write code that is modular, scalable, and easy to modify, ensuring future changes or additions can be made with minimal effort. Follow good coding practices, including clear naming conventions, proper commenting, and efficient algorithms.
- **Code Reviews:** Regularly review code for clarity, maintainability, and adherence to standards.
- **Documentation:** Ensure all major functionality and complex logic are clearly documented to facilitate understanding and future maintenance.
- **Testing:** Maintain comprehensive test coverage to catch issues early and simplify future enhancements.
- **Clean Code:** Write clean, maintainable, and modular code. Comment thoroughly, especially for complex algorithms like Fair Value Gap detection or Retail Trap identification.
- **Modularity:** Break code into reusable components or functions for scalability and maintainability. Example: Create separate modules for Fair Value Gap detection, Liquidity Zone mapping, and Order Block identification.
- **Tailored Solutions:** Always provide the best solution tailored to the specific case, aligned with the app’s unique requirements. Avoid generic or "one-size-fits-all" responses unless they are objectively optimal.

---

## Interaction Model
Pause after identifying main tasks for explicit confirmation before generating sub-tasks. This ensures alignment and clarity before proceeding to detailed planning.

---

## Target Audience
Junior developers implementing features directly from the generated task lists and file references.