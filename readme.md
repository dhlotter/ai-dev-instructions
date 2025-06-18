# AI Development Project Framework

This repository provides a standardized framework for starting new development projects. It includes a directory structure and workflow for taking ideas from conception to production-ready tasks.

## Getting Started

To start a new project using this framework, run the `setup.sh` script and provide a name for your new project.

### Prerequisites

- A Unix-like shell (e.g., bash, zsh)

### Usage

1.  **Clone the Template Repository (One-time or for updates):**
    Clone this `ai-dev-instructions` repository to a convenient location on your local machine (e.g., `~/templates/`).
    ```bash
    git clone <your-github-repo-url>/ai-dev-instructions.git ~/templates/ai-dev-instructions
    ```

2.  **Navigate to Your Projects Directory:**
    Go to the parent directory where you want to create your new, independent project (e.g., `~/my_projects`).
    ```bash
    cd ~/my_projects
    ```

3.  **Run the Setup Script:**
    Execute the `setup.sh` script from the cloned template directory, providing your new project's name as an argument.
    ```bash
    ~/templates/ai-dev-instructions/setup.sh my-new-awesome-project
    ```

This will create a new directory named `my-new-awesome-project` in your current location (e.g., `~/my_projects/my-new-awesome-project`). This new project directory will contain:
- The `.ai` directory (with subfolders for `1.ideas`, `2.prd`, `3.tasks`, and workflow guidelines like `rule.task.md`).
- The `.windsurf` directory (with its `rules` subdirectory).

Your new project is now set up and independent of the template repository, ready for you to start your development workflow: Ideation -> PRD -> Tasks.

## Project Workflow

This framework is designed to guide your project through distinct phases:

1.  **Ideation (`.ai/1.ideas/`):** Brainstorm and develop your initial concepts.
2.  **Product Requirements Document (PRD) (`.ai/2.prd/`):** Define the project's scope, features, and specifications.
3.  **Tasks (`.ai/3.tasks/`):** Break down the PRD into actionable development tasks.

Detailed guidelines for this workflow, including AI collaboration and file management, can be found within the `rule.task.md` file inside the copied `.ai` directory of your new project.
