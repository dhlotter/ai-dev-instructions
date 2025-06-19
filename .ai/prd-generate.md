---
trigger: generate_prd
---

# How to use this template:
1. When the user asks to create a PRD, use this template
2. Fill in all sections with clear, specific details
3. Use checkboxes for items that need to be completed

# Product Requirements Document (PRD)

## Document Information
- **PRD Title:** [Feature Name] - Be specific and descriptive  
- **Type:** Feature / Enhancement / Bugfix / Experiment  
- **Status:** Draft / In Review / Approved  
- **Version:** v0.1 (start with 0.1 and increment as needed)  
- **Author:** [Your Name]  
- **Date:** YYYY-MM-DD  
- **Reference Links:** [Link to idea, ticket, design, or research]

## 1. Overview
[High-level description of the feature and its purpose]

## 2. Problem Statement
[What problem are we solving? Why is this important?]

## 2.5 Scope
### In Scope
List the specific features, flows, or areas that will be delivered.

- [Feature A]: [Brief description]
- [Flow B]: [Brief description]

### Out of Scope
List anything explicitly not being delivered now, and why.

- [Deferred Feature X] – Out of scope due to [reason]

## 3. Goals & Objectives
- Goal 1
- Goal 2
- Goal 3

## 4. User Stories
Use these predefined user types when writing user stories, unless the project specifies different personas.
- **First-time user** – Someone who has never used the product before.
- **Returning user** – Someone who has used the product at least once.
- **Admin** – Someone with elevated privileges to manage content, users, or settings.
- **System** – An automated process or background job that performs actions without direct user interaction.

Use the format: “As a [user type], I want to [do something], so that [benefit/value].”

### Primary User Stories
- As a [first-time user], I want to [easily sign up] so that [I can quickly start using the app]
- As an [admin], I want to [see user activity logs] so that [I can audit system usage]

### Secondary User Stories
- As a [returning user], I want to [resume where I left off] so that [I can continue work efficiently]

## 5. Requirements
### Functional Requirements
These describe what the system should do.

- FR-1: Users can log in using email and password.
- FR-2: Admins can deactivate user accounts.

### Non-Functional Requirements
These describe how the system should behave (performance, security, reliability, etc.)

- NFR-1: System should respond to API calls in under 300ms.
- NFR-2: The system must support 99.9% uptime.

## 6. User Flow
Describe the key steps a user takes to complete the primary task(s). Use text, bullets, or link to a diagram.

- Start: [e.g., User lands on login page]
- Step 1: [e.g., Enters credentials and submits]
- Step 2: [e.g., System validates user]
- End: [e.g., User is redirected to dashboard]

Optionally, link to:
- User flow diagram (Figma, Lucidchart, etc.)
- Screens or wireframes supporting each step

## 7. Technical Considerations
Document any technical constraints, architectural decisions, or considerations relevant to engineering teams.

- What existing systems, services, or APIs does this feature rely on?
- Are there platform-specific concerns (web, mobile, backend)?
- Will this introduce new technologies, frameworks, or tools?

### Dependencies
List any external dependencies this feature requires (APIs, teams, services, libraries).

- Dependency 1
- Dependency 2

## 8. Design & UI/UX
Link or describe the visual and interactive elements of this feature.

- Link to Figma mockups or prototypes
- Responsive behavior (mobile, tablet, desktop)
- Accessibility requirements (WCAG AA, etc.)
- Visual consistency with design system or style guide
- Status of design (e.g., WIP, final, awaiting review)

## 9. Data Model
Document any new data structures, schema changes, or models required for this feature.

- Describe new tables, collections, or objects
- Include key fields, types, and relationships
- Specify any schema changes to existing models

Optionally, link to:
- ERD or data flow diagrams
- Source-of-truth documentation or schema registry

## 10. Security & Privacy
List all security and privacy implications of this feature.

- What user data is being collected, stored, or transmitted?
- Are there new authentication or authorization concerns?
- Are there any encryption, tokenization, or data masking needs?
- Are there compliance/regulatory concerns? (e.g., GDPR, HIPAA, SOC 2)
- How is access to this data logged or audited?

## 11. Performance Considerations
Define how the system should perform under expected and peak conditions.

- Expected response times for key operations
- Load or concurrency limits
- Graceful degradation or fallback behavior
- Performance benchmarks (if known)
- Differences in dev, staging, and production environments

## 12. Success Metrics
Define measurable outcomes that indicate whether the feature is successful.

- What user behavior or system outcome will prove this feature worked?
- Are there quantitative goals? (e.g., conversion rate, error reduction, engagement)
- How will you track or report these metrics?
- What is the baseline and target?

Examples:
- Increase sign-up conversion from 20% to 30%
- Reduce failed logins by 25%
- Maintain system response time under 300ms at 95th percentile

## 13. Open Questions
List any unresolved questions that need clarification from stakeholders, users, or engineering.

- Are there edge cases we haven't accounted for?
- Do we have alignment on platform support?
- Are there constraints we haven't validated (e.g., legal, infra)?
- What decisions are pending that affect scope or design?

## 14. Out of Scope
List items explicitly not included in this feature. These may be deferred for later, irrelevant to the current scope, or handled elsewhere.

- [Feature or item not included] – [brief reason]
- [Another excluded item] – [reason]

## 15. Future Enhancements
List ideas that are intentionally excluded from the current scope but may be revisited in the future.

- Improvements based on user feedback
- Features that were out of scope for MVP
- Enhancements for scalability, automation, or analytics

## 16. Risks & Mitigations
Identify known risks to delivery, adoption, or success — and how they will be mitigated.

- Risk: [What might go wrong?]  
  - Likelihood: [Low / Medium / High]  
  - Impact: [Low / Medium / High]  
  - Mitigation: [What’s the plan to reduce or handle this?]

Example:
- Risk: Design handoff may be delayed  
  - Likelihood: Medium  
  - Impact: High  
  - Mitigation: Begin backend work in parallel with finalizing UI

## 17. Assumptions
List any assumptions made during planning, design, or implementation. These are conditions you believe to be true but haven't formally validated.

- Users are always logged in
- Admin users have permission to access all dashboards
- Third-party API will remain available and stable
- No major changes to underlying platform during implementation

## Target Audience
This PRD is written for a **junior developer** audience.

- Avoid jargon and assumptions.
- Use clear, direct language.
- Ensure enough context is provided for someone unfamiliar with the system to build and test the feature independently.

## 18. Business Impact
Describe the expected business value this feature will deliver.

### Value Proposition
- What benefit does this feature provide (to the business or user)?
- How does it support strategic goals (growth, retention, efficiency, etc.)?

### Metrics to Track
- Adoption rate: % of users who use this feature within [X] days
- Retention impact: Change in [daily/weekly/monthly] active users
- Time/cost saved: Hours or dollars saved per user/month
- Conversion uplift: % improvement in sign-up, checkout, or goal completion
- Revenue impact: $ increase attributed to this feature
- Support volume: Reduction in tickets, complaints, or escalations

## Final instructions

1. Do NOT start implementing the PRD
2. Make sure to ask the user clarifying questions
3. Take the user's answers to the clarifying questions and improve the PRD

## How to Use This Template
- Complete each section with specific, actionable information.
- Use bullet points or short paragraphs where appropriate.
- Ask clarifying questions if any section is ambiguous.
- Do not begin development until the PRD is reviewed and approved by relevant stakeholders.
- This document is optimized for junior developers and AI agents — be precise and clear.
