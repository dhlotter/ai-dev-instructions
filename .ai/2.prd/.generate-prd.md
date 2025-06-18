---
trigger: manual
---

# Product Requirements Document (PRD) Template

## Document Information
- **PRD Title:** [Feature Name]
- **Type:** [Feature/Global]
- **Status:** Draft/In Review/Approved
- **Author:** [Your Name]
- **Date:** YYYY-MM-DD
- **Related Idea:** [Link to idea file if applicable]

## 1. Overview
[High-level description of the feature and its purpose]

## 2. Problem Statement
[What problem are we solving? Why is this important?]

## 3. Goals & Objectives
- [ ] Goal 1
- [ ] Goal 2
- [ ] Goal 3

## 4. User Stories
### Primary User Stories
- [ ] As a [user type], I want to [action] so that [benefit]
- [ ] As a [user type], I want to [action] so that [benefit]

### Secondary User Stories
- [ ] As a [user type], I want to [action] so that [benefit]

## 5. Requirements
### Functional Requirements
- [ ] FR-1: [Description]
- [ ] FR-2: [Description]

### Non-Functional Requirements
- [ ] NFR-1: [Description]
- [ ] NFR-2: [Description]

## 6. User Flow
[Describe the user journey or include a diagram]

## 7. Technical Considerations
- [ ] Technical requirement 1
- [ ] Technical requirement 2
- [ ] Dependencies

## 8. Design & UI/UX
[Include links to designs, mockups, or describe the UI/UX]

## 9. Data Model
[Describe any new data structures or changes to existing ones]

## 10. Security & Privacy
- [ ] Security consideration 1
- [ ] Privacy consideration 1

## 11. Performance Considerations
- [ ] Performance requirement 1
- [ ] Performance requirement 2

## 12. Success Metrics
- [ ] Metric 1
- [ ] Metric 2

## 13. Open Questions
- [ ] Question 1
- [ ] Question 2

## 14. Out of Scope
- [ ] Item 1
- [ ] Item 2

## 15. Future Enhancements
- [ ] Enhancement 1
- [ ] Enhancement 2

## 16. References
- [Link to related documents or resources]

## PRD Structure

The generated PRD should include the following sections:

1.  **Introduction/Overview:** Briefly describe the feature and the problem it solves. State the goal.
2.  **Goals:** List the specific, measurable objectives for this feature.
3.  **User Stories:** Detail the user narratives describing feature usage and benefits.
4.  **Functional Requirements:** List the specific functionalities the feature must have. Use clear, concise language (e.g., "The system must allow users to upload a profile picture."). Number these requirements.
5.  **Non-Goals (Out of Scope):** Clearly state what this feature will *not* include to manage scope.
6.  **Design Considerations (Optional):** Link to mockups, describe UI/UX requirements, or mention relevant components/styles if applicable.
7.  **Technical Considerations (Optional):** Mention any known technical constraints, dependencies, or suggestions (e.g., "Should integrate with the existing Auth module").
8.  **Success Metrics:** How will the success of this feature be measured? (e.g., "Increase user engagement by 10%", "Reduce support tickets related to X").
9.  **Open Questions:** List any remaining questions or areas needing further clarification.

## Target Audience

Assume the primary reader of the PRD is a **junior developer**. Therefore, requirements should be explicit, unambiguous, and avoid jargon where possible. Provide enough detail for them to understand the feature's purpose and core logic.

## Output

*   **Format:** Markdown (`.md`)
*   **Location:** `/.tasks/`
*   **Filename:** `prd-[feature-name].md`

## Final instructions

1. Do NOT start implementing the PRD
2. Make sure to ask the user clarifying questions
3. Take the user's answers to the clarifying questions and improve the PRD