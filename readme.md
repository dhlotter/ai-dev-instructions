# AI Development Project Framework

This repository provides a standardized framework for starting new development projects. It includes a directory structure and workflow for taking ideas from conception to production-ready tasks.

## Getting Started
In the folder where you want to create your new project, run the following command:
```bash
bash <(curl -sSL https://raw.githubusercontent.com/dhlotter/ai-dev-instructions/main/setup.sh)

```

### Usage

This framework is designed to guide your project through distinct phases:

1.  **Ideation:** Brainstorm and develop your initial concepts in `.ai/work/`
```text
my idea is:
a simple to-do app with status managment (todo, in progress, done) i a kanban board. the app should have a dark mode and should be responsive.
```

2.  **Product Requirements Document (PRD):** Define the project's scope, features, and specifications in `.ai/work/`
```text
generate the prd
```

3.  **Tasks:** Break down the PRD into actionable development tasks using Kilo Code's internal task system
```text
create tasks
```

All project files are stored in `.ai/work/` for easy access and organization.

Detailed guidelines for this workflow, including AI collaboration and file management, can be found within the [`.ai/rules/5-task-generation.md`](.ai/rules/5-task-generation.md) file inside the copied `.ai` directory of your new project.
