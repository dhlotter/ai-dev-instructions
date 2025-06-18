# AI Development Project Framework

This repository provides a standardized framework for starting new development projects. It includes a directory structure and workflow for taking ideas from conception to production-ready tasks.

## Getting Started
In the folder where you want to create your new project, run the following command:
```bash
bash <(curl -sSL https://raw.githubusercontent.com/dhlotter/ai-dev-instructions/main/setup.sh)
```

### Usage

This framework is designed to guide your project through distinct phases:

1.  **Ideation (`.ai/1.ideas/`):** Brainstorm and develop your initial concepts.
```text 
i want to create a simple to-do app with status managment (todo, in progress, done) i a kanban board. the app should have a dark mode and should be responsive. 

idea: [.ai/1.ideas/idea.md]

```

2.  **Product Requirements Document (PRD) (`.ai/2.prd/`):** Define the project's scope, features, and specifications.
```text 
generate the prd

prd:    [] 
rules:  [.ai/2.prd/.generate-prd.md]
```

3.  **Tasks (`.ai/3.tasks/`):** Break down the PRD into actionable development tasks.
```text 
generate the tasks

prd:    [] 
rules:  [.ai/3.work/.generate-tasks.md]
```

Detailed guidelines for this workflow, including AI collaboration and file management, can be found within the `rule.task.md` file inside the copied `.ai` directory of your new project.
