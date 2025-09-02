# Technology Stack and Development Rules

This document outlines the recommended technology stack and development workflow rules for new coding projects. It consolidates guidelines from various sources to provide a comprehensive framework that works across different coding agents.

## 1. Tech Stack

### Primary Stack (Full-Stack Web Application)
**Frontend:**
- Next.js + React

**Design & UI:**
- Tailwind CSS
- shadcn/ui (UI Library)

**Backend Options:**
- Option A: Cloudflare Workers (serverless)
- Option B: FastAPI (Python)

**Database Options:**
- Option A: Convex (real-time database)
- Option B: Supabase (PostgreSQL with real-time features)

**Authentication Options:**
- Option A: Clerk (managed auth service)
- Option B: Supabase Auth

**Additional Services:**
- Payments: Stripe
- Subscriptions: RevenueCat
- Emails: Resend
- Analytics: PostHog
- Monitoring: UptimeRobot
- Chat Support: Crisp
- Deployment: GitHub Actions

### Alternative Stack (Python-Heavy Backend)
**Frontend:** Next.js + React
**Backend:** FastAPI (Python)
**Database:** Supabase
**Authentication:** Supabase Auth
**Design:** Tailwind CSS + shadcn/ui

## 2. UI Component Guidelines
- Always use ShadCN components where applicable.
- Use Context7 MCP Tool to find applicable components and packages.
- Use Serper and Fetch MCP Tools for additional information.
- If the user provides a URL for a component or package, use the fetch tool to scrape it.
- Maintain a list of used ShadCN components in [shadcn-components.md](work/shadcn-components.md)
- Use MDX format for component documentation where supported
- For Next.js projects, import shadcn components from "@/components/ui"

## 3. Integration Guidelines

### Supabase Integration
- Use Supabase Auth for user management
- Implement real-time subscriptions for data updates
- Use Supabase Edge Functions for serverless operations

### Payment Integration
- Use Stripe SDK for payment processing
- Implement proper error handling and logging
- Follow PCI compliance guidelines

### Analytics
- Use PostHog for user behavior tracking
- Implement proper event tracking
- Set up dashboard for key metrics

### Communication
- Integrate Crisp chat for customer support
- Use Resend for transactional emails
- Implement proper message queuing

## 4. Tool Usage Guidelines
- Use Context7 for component discovery
- Use Serper and Fetch for package information
- Use proper tool formatting for each IDE
- Maintain consistent error handling
- For Next.js projects, import shadcn components from "@/components/ui"
- Maintain a list of used ShadCN components in [shadcn-components.md](work/shadcn-components.md)

### IDE-Specific Tools
- Windsurf: Use MCP tools for implementation
- Lovable: Use lov-* commands for file operations
- v0: Use Code Project blocks for Next.js
- Roo: Use proper Roo tool formatting
- Kilo Code: Use MCP configurations for enhanced functionality
- Cline: Use appropriate tool formatting

## 5. Important Constraints
1. Restricted Files
   - `src/api/client.ts`
   - `src/types/index.ts`
   - `src/config/index.ts`
2. Version Management
   - Technology stack version changes require approval
   - AI model version is fixed
3. Code Placement
   - Common processes in `src/utils/`
   - UI components in `src/components/ui/`
   - API endpoints in `src/api/`

## 6. Version Management
- Keep core libraries up to date with LTS versions
- Maintain compatibility between frontend and backend versions
- Regular security updates for all dependencies