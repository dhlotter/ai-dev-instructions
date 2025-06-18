# AWS CUR Cost Optimization Analyzer Web Application

## Metadata

* **Target release:** V1 (MVP)
* **Epic:** AWS Cost Optimization Analysis
* **Document status:** DRAFT
* **Document owner:** [Your Consulting Business Name]
* **Designer:** TBD
* **Developers:** TBD
* **QA:** TBD

## Vision

A premium, self-hosted web application that provides comprehensive AWS cost optimization insights by analyzing Cost and Usage Reports (CUR) data. The application will help organizations identify cost-saving opportunities, track optimization efforts, and make data-driven decisions about their AWS spending. The solution will be deployed on Hetzner infrastructure with a focus on security, performance, and ease of use.
## Pricing & Tiers

### Free Tier (Demo)
- Always-available demo environment
- Sample AWS cost data
- Full feature access with demo data
- No time limits or restrictions

### Paid Tier
- Full AWS account integration
- Real-time cost analysis
- Advanced reporting
- Self-service setup
- No support included

### Consulting Option
- Percentage of first month's savings
- Automated implementation
- Optional monthly reviews
- Custom optimization strategies

## Goals

* Provide a premium, paid web-based interface for analyzing AWS cost and usage data
* Offer clear visibility into current Savings Plans and Reserved Instance coverage
* Identify optimization opportunities for SP/RI purchases to maximize savings
* Detect and report on orphaned and underutilized AWS resources
* Generate actionable insights with clear ROI calculations
* Support single AWS account connection per team with simplified management
* Enable user-configurable periodic processing of CUR data
* Provide team collaboration features with unified access control

## Target Users

* **Cloud Architects** - Need detailed cost optimization insights
* **FinOps Teams** - Require comprehensive cost reporting and forecasting
* **Engineering Managers** - Want to track team spending and identify waste
* **C-Level Executives** - Need high-level cost visibility and trends
* **DevOps Engineers** - Require actionable recommendations for cost optimization

## User Journey

1.  **Public Landing Page & Authentication**
    - Users visit the public landing page showcasing features, pricing, and clear call-to-actions for both login and registration.
    - Two authentication methods are available:
      - Email/Password: Traditional registration and login flow
      - Google Sign-In: One-click authentication using Google accounts
    - Users can register for a free account without providing payment information.
    - Email verification flow is completed for email/password signups.
    
### Authentication Flow Details
- **Login Page** (`/auth/login`):
  - Clean, modern design with Google and Email sign-in options
  - Clear navigation to registration for new users
  - Responsive layout that works on all devices
  
- **Registration Page** (`/register`):
  - Simple form with name, email, and password fields
  - Google Sign-Up option for quick registration
  - Clear privacy policy and terms of service links
  
- **Security Features**:
  - Secure password requirements
  - CSRF protection
  - Rate limiting on authentication attempts
  - Secure session management

2.  **Demo Experience (Free Tier)**
    - Upon successful registration and email verification, users gain immediate access to a demo environment.
    - The demo environment is populated with sample AWS cost data, allowing users to explore all application features (reports, recommendations) in a read-only or sandboxed mode.
    - Clear prompts and calls-to-action will encourage users to upgrade for full functionality with their own AWS data.

3.  **Upgrade to Paid Tier**
    - Users can choose to upgrade to a paid tier at any time from within the application.
    - The upgrade process will involve selecting a plan and completing payment through the integrated Stripe system.

4.  **AWS Account Connection Wizard (Post-Upgrade)**
    - After upgrading to a paid tier, users will be guided through an **AWS Account Connection Wizard**.
    - This wizard will help users securely connect their AWS account(s) by:
        - Guiding them to link an existing Cost and Usage Report (CUR) S3 bucket.
        - Providing instructions or a CloudFormation template to set up a new CUR if one doesn't exist and configure necessary IAM permissions (read-only access to CUR data and relevant services like Cost Explorer).
    - The wizard will confirm successful connection and CUR accessibility.

5.  **Data Processing & Dashboard Population**
    - Once an AWS account is successfully connected and CUR data is accessible, the system will initiate the first data processing job (this will be added to a resilient queue).
    - After initial processing, the user's dashboard will be populated with their actual AWS cost data, reports, and tailored optimization recommendations.
    - Users will be notified when their data is ready.

6.  **Ongoing Use & Team Collaboration**
    - Users can log in to view updated reports and recommendations as new CUR data is processed according to a configurable schedule.
    - Paid users can invite team members to their workspace to view data, reports, and collaborate on optimization efforts. User management for their workspace will be available.

7.  **Consulting Engagement (Optional)**
    - The application will feature clear calls-to-action within the recommendations section, inviting users to contact the service provider for professional consulting to help implement the identified savings opportunities.

### 4. Team Management
   - **User Management**
     - Invite team members via email
     - Unified access to all resources
     - Team activity log
   - **Collaboration**
     - Shared dashboards and reports
     - In-app notifications
     - Comment threads on recommendations
   - **Admin Controls (User-Facing for their Workspace)**
     - Manage team member roles and permissions within their own workspace.
     - View their own billing history and manage their subscription.

## Key Features

### 1. Authentication & User Management
   - **User Registration & Login**
     - Email/password and social authentication
     - Multi-factor authentication (MFA)
     - Password reset flow
   - **Profile Management**
     - Personal information
     - Notification preferences
     - API keys for programmatic access

### 2. Admin Dashboard (Internal System Admin)
   - **Master Admin View & Key Metrics**
     - Centralized dashboard to view all registered users/clients and their high-level status.
     - Access to individual client accounts for support and troubleshooting (with appropriate audit trails).
     - System-wide metrics and analytics, including:
        - Total users (broken down by status: demo, trial, paid).
        - Monthly Recurring Revenue (MRR) / Annual Recurring Revenue (ARR).
        - Active subscriptions and churn rate.
        - Demo-to-paid conversion rates.
        - Overview of pending and failed payments.
   - **User Management**
     - View all registered users
     - User activity monitoring
     - Account status management
     - Impersonate user accounts (for support)
     - Manual user creation with custom attributes
   - **Payment Management (Admin)**
     - View and modify the payment status of any user account (e.g., manually activate a paid tier for testing/VIP users without immediate payment).
     - Grant or revoke trial access and set custom trial periods.
     - Override subscription status (e.g., `active`, `trial`, `payment_required`, `grace_period`).
     - View detailed payment history and receipts for all users.
     - Manage and follow up on failed payments, including triggering reminder notifications or temporarily suspending access after a grace period.
   - **System Health Monitoring**
     - Real-time monitoring of key system components:
        - API performance: response times, error rates, request volume.
        - Background job status: view status and logs for CUR processing, email delivery, and other asynchronous tasks.
        - Queue monitoring: status and length of CUR processing queues and email delivery queues.
        - Database performance and storage usage.
        - Application uptime and availability.
        - Automated backup status and management.
   - **Billing & Subscription**
     - Usage metrics across all accounts
     - Billing history and reconciliation
     - Plan management and modifications
     - Discount and promotion management

### 3. Multi-Account Management
   - **Account Dashboard**
     - Overview of all connected AWS accounts
     - Status of each connection
     - Quick access to account details
   - **Account Groups**
     - Organize accounts by team/department
     - Set group-level permissions
     - Apply bulk actions

### 4. Cost Optimization Analysis
   - **Savings Plans & Reserved Instances**
     - Coverage and utilization analysis
     - Purchase recommendations
     - What-if analysis for different commitment levels
   - **Resource Optimization**
     - Underutilized resources
     - Idle resource detection
     - Right-sizing recommendations
   - **Anomaly Detection**
     - Unusual spending patterns
     - Cost spike alerts
     - Budget tracking and alerts

### 5. Reporting & Analytics
   - **Standard Reports**
     - Cost by service/account/region
     - Monthly cost trends
     - Savings realization tracking
   - **Custom Reports**
     - Drag-and-drop report builder
     - Save and schedule reports
     - Export to multiple formats (PDF, CSV, Excel)

### 6. Integration & API
   - **Webhook Support**
     - Trigger actions on specific events
     - Integration with Slack/Teams
   - **REST API**
     - Full API documentation
     - SDKs for popular languages
     - Rate limiting and quotas

## User Roles & Permissions

### 1. Guest Users
   - View public documentation
   - Access pricing and features
   - Start registration process

### 2. Registered Users (Demo Mode)
   - Access to demo data dashboard
   - View sample reports and recommendations
   - Explore all features with demo data
   - Cannot connect AWS accounts until upgrade
   - Limited to demo data exports
   - Manage personal settings
   - Upgrade to full version at any time

### 3. Team Members
   - All Registered User permissions
   - Share dashboards with team
   - Collaborate on reports
   - View team resources

### 4. Team Administrators
   - All Team Member permissions
   - Invite/remove team members
   - Manage team settings
   - View team activity

### 5. System Administrators
   - **Full System Access**
     - View all clients and reports
     - Impersonate user accounts
     - System configuration
   - **User Management**
     - Create/manage users
     - Payment status overrides
     - Trial period management
   - **System Operations**
     - Monitor system health
     - View audit logs
     - Manage automated backups
   - **Security**
     - IP access controls
     - Session management
     - 2FA enforcement

## Payment Management

### Payment Status Handling
- **Status Types**:
  - `active`: Full access, payment verified
  - `demo`: Access to demo data only
  - `trial`: Limited-time full access (optional)
  - `payment_required`: Restricted access, payment needed
- **Admin Override**:
  - Manual status changes by admin
  - Custom trial period assignment
  - Payment requirement bypass capability
- **Grace Periods**:
  - Configurable grace period for failed payments
  - Automated notifications for upcoming renewals

### Demo Data Experience
- **Demo Data Access**
  - Automatically available after registration
  - Realistic but anonymized AWS cost data
  - All features enabled in read-only mode
  - Clear watermarks on demo data
  - Limited to 7 days of historical data
  - No AWS account connection required
  - Prominent upgrade CTAs
  - Sample optimization recommendations
  - Export disabled for demo data

### Trial Management (Optional)
- **Trial Periods**:
  - Default trial length configuration
  - Extendable trials
  - Usage limits during trial
- **Trial Conversion**:
  - Automated conversion to paid
  - Reminder notifications
  - Post-trial follow-up

### Audit & Compliance
- **Payment Logs**:
  - All payment status changes
  - Admin actions with timestamps
  - User-facing notifications history
- **Security**:
  - IP-based access restrictions for admin features
  - 2FA requirement for admin accounts
  - Session management and timeout policies

## Technical Architecture

### Recommended Stack

#### Frontend
- **Core Framework**: Next.js (React) with TypeScript
  - Server-side rendering for better SEO and initial load
  - API routes for backend integration
  - Great developer experience
- **UI Components**: shadcn/ui
  - Build your design system with Radix UI primitives
  - Full customization to match your brand
  - Excellent for data tables and complex interfaces
- **Animation**: Framer Motion
  - Add smooth animations where needed
  - More control than Animate UI
  - Better performance for complex animations
- **Data Visualization**: Recharts or Visx
  - For your cost analysis charts and graphs
  - More control than charting libraries with built-in components
- **Styling**: Tailwind CSS (Utility-first CSS framework)
- **Authentication**: Supabase Auth (Email/Password + Social Logins)

#### Backend (API)
- **Framework**: FastAPI (Python)
- **Database ORM**: SQLAlchemy + SQLModel (Type-safe SQL)
- **API Documentation**: Auto-generated OpenAPI/Swagger
- **Authentication**: JWT with Supabase Auth integration
- **Background Tasks**: Celery with Redis (for async processing)
- **Caching**: Redis for frequently accessed data

#### Database (Supabase)
- **Primary Database**: PostgreSQL (Hosted on Supabase)
- **Auth & Users**: Supabase Auth (Built-in)
- **Realtime**: Supabase Realtime for live updates
- **Storage**: Supabase Storage for reports/exports
- **Edge Functions**: Supabase Edge Functions for serverless endpoints

#### Data Processing
- **ETL Pipeline**: Custom Python workers with Pandas/NumPy
- **Data Lake**: AWS S3 (For raw CUR data)
- **Query Engine**: PostgreSQL (For processed data)
- **Analysis**: Python data science stack (Pandas, NumPy, Dask for large datasets)

#### Infrastructure
- **Hosting**: 
  - **Production**: Docker containers on Hetzner
  - **Development**: Local development environment
  - **Future**: AWS containers when scaling requires it
- **Database**: Supabase (PostgreSQL + Auth + Storage)
- **CI/CD**: GitHub Actions
- **Infrastructure as Code**: Terraform
- **Monitoring**: 
  - Uptime monitoring (Uptime Kuma)
  - Error tracking (Sentry)
  - Supabase Logs
- **Security**: 
  - Supabase RLS (Row Level Security)
  - SSL/TLS encryption
  - Regular security audits
  - Email verification required for all user accounts
- **Authentication**:
  - Supabase Auth
  - Social Login: Google
  - Email/Password with verification
- **Email Service**: Resend for transactional emails
- **Payments**: Stripe integration for subscription management

#### Key Integrations
- **AWS SDK**: For CUR data access and AWS service interactions
- **Stripe**: Payment processing
- **Email Service**: Resend for transactional emails
- **Logging**: Structured logging with Python's logging module

### Project Structure

```
/aws-cost-analyzer
├── /backend
│   ├── /app
│   │   ├── /api          # API endpoints
│   │   ├── /core         # Core config and utils
│   │   ├── /models       # SQLModel models
│   │   ├── /services     # Business logic
│   │   └── /supabase     # Supabase config
│   ├── /migrations       # Alembic migrations
│   ├── .env              # Environment variables
│   └── main.py           # FastAPI app
│
├── /frontend
│   ├── /src
│   │   ├── /lib
│   │   │   └── supabase.js  # Supabase client
│   │   ├── /routes
│   │   ├── app.html
│   │   └── app.css
│   └── svelte.config.js
│
├── docker-compose.yml     # For local dev
└── README.md
```

This structure follows a clean architecture approach, separating concerns and making the codebase maintainable and scalable.

### Development Workflow
1. **Local Development**:
   - Frontend: `npm run dev` (SvelteKit dev server)
   - Backend: `uvicorn main:app --reload` (FastAPI dev server)
   - Database: Local PostgreSQL or Supabase local development

2. **Testing**:
   - Unit Tests: pytest
   - E2E Tests: Playwright
   - API Tests: FastAPI TestClient

3. **Deployment**:
   - Automated CI/CD with GitHub Actions
   - Preview deployments for PRs
   - Zero-downtime deployments

## UI/UX Design

### Design System

#### Color Palette
- **Primary**: `#2563eb` (Blue 600)
- **Secondary**: `#1e40af` (Blue 800)
- **Accent**: `#3b82f6` (Blue 500)
- **Background**: `#f8fafc` (Slate 50)
- **Surface**: `#ffffff` (White)
- **Text Primary**: `#0f172a` (Slate 900)
- **Text Secondary**: `#475569` (Slate 600)
- **Success**: `#10b981` (Emerald 500)
- **Warning**: `#f59e0b` (Amber 500)
- **Error**: `#ef4444` (Red 500)

#### Typography
- **Primary Font**: Inter (Sans-serif)
- **Base Size**: 16px
- **Scale**: 1.25 (Major Third)
- **Headings**: Semi-bold to bold weights
- **Body**: Regular weight, 1.5 line height

#### Spacing
- **Base Unit**: 4px
- **Scale**: 0.25rem, 0.5rem, 1rem, 1.5rem, 2rem, 3rem, 4rem

#### Components
- **Buttons**: Rounded corners, consistent padding, clear hierarchy
- **Cards**: Subtle shadow, rounded corners, white background
- **Forms**: Clear labels, helpful error messages, minimal styling
- **Navigation**: Left sidebar for main navigation, top bar for user controls

### User Flows

#### 1. Registration & Authentication
1. **Landing Page**
   - Clean, focused hero section with value proposition
   - Clear call-to-action buttons for Sign Up/Login
   - Screenshot/preview of the dashboard

2. **Registration**
   - Simple form with email/password or Google sign-up
   - Email verification required before first login
   - Success message with instructions to check email

3. **Email Verification**
   - Clear verification email with branded template
   - Single, prominent verification button
   - Link expires in 24 hours

4. **Login**
   - Email/password or Google login
   - Remember me option
   - Forgot password flow

#### 2. Dashboard (Post-Login)
- **Layout**: Left sidebar navigation, top bar with user menu
- **Default View**: Overview with key metrics and visualizations
- **Content**: Demo data for new users
- **Navigation**: Clear paths to all major features

#### 3. Responsive Design
- Mobile-first approach
- Collapsible sidebar on smaller screens
- Touch-friendly controls
- Readable text and tap targets on all devices

## Non-Functional Requirements

### Performance
- Dashboard loads in under 2 seconds
- Reports generate within 30 seconds for standard queries
- Support for datasets up to 10TB in size

### Security
- End-to-end encryption for all data in transit and at rest
- SOC 2 Type II and GDPR compliance
- Regular security audits and penetration testing

### Availability
- 99.9% uptime SLA
- Multi-AZ deployment for high availability
- Regular automated backups with point-in-time recovery

### Scalability
- Horizontal scaling to support thousands of concurrent users
- Automatic scaling based on load
- Support for multi-region deployment

## Success Metrics

1. **User Adoption**
   - Number of active users
   - Frequency of logins
   - Feature usage statistics

2. **Cost Savings**
   - Identified potential savings
   - Realized savings from implemented recommendations
   - Reduction in wasted spending

3. **System Performance**
   - API response times
   - Report generation times
   - System uptime and availability

## Future Enhancements

1. **AI-Powered Recommendations**
   - Machine learning for predictive cost optimization
   - Anomaly detection for unexpected cost spikes

2. **Multi-Cloud Support**
   - Azure Cost Management integration
   - Google Cloud cost optimization

3. **Advanced Analytics**
   - Custom ML models for cost prediction
   - What-if analysis for infrastructure changes

4. **Workflow Automation**
   - Approval workflows for cost optimization actions
   - Integration with ticketing systems like Jira

## Open Questions

1. What level of granularity is needed for access control?
2. Are there specific compliance requirements to consider?
3. What is the expected number of users and AWS accounts?
4. Are there any specific AWS services that should be prioritized for optimization?

## Next Steps

1. Finalize technical requirements
2. Create detailed wireframes and user flows
3. Set up development environment and CI/CD pipeline
4. Begin implementation with core features
5. Conduct user testing and gather feedback
6. Plan for beta release with select customers

Many AWS customers leave significant cost savings on the table through suboptimal use of Savings Plans and Reserved Instances, as well as by maintaining unused resources. This tool will analyze AWS Cost and Usage Report (CUR) data to identify these opportunities, providing a clear path to immediate cost reductions.

## User Stories

### As a cloud consultant, I want to:
1. View current SP/RI coverage and utilization metrics
2. Identify underutilized reservations that could be modified or sold
3. See recommendations for additional SP/RI purchases with expected ROI
4. Get a list of orphaned resources that could be terminated
5. Generate client-ready reports showing potential savings

## Requirements

### Functional Requirements

#### 1. Data Collection
- [ ] Connect to AWS accounts via cross-account roles
- [ ] Pull and process CUR data from S3 buckets
- [ ] Support both CSV and Parquet CUR formats
- [ ] Handle data refresh on a configurable schedule

#### 2. SP/RI Analysis
- [ ] Calculate current SP/RI coverage by service and region
- [ ] Identify underutilized reservations
- [ ] Recommend optimal SP/RI purchases based on historical usage
- [ ] Calculate potential savings from recommendations

#### 3. Orphaned Resource Detection
- [ ] Identify unattached EBS volumes
- [ ] Find unassociated Elastic IPs
- [ ] Detect idle load balancers
- [ ] List old snapshots
- [ ] Calculate potential savings from cleanup

### Non-Functional Requirements
- [ ] Process large CUR files efficiently
- [ ] Maintain data security and least-privilege access
- [ ] Support multi-account/multi-region analysis
- [ ] Generate reports in PDF and Excel formats

## Success Metrics
- Percentage of on-demand usage covered by SP/RI
- Estimated annual savings from SP/RI optimization
- Count and cost of identified orphaned resources
- Time to generate initial analysis

## Out of Scope
- Automated remediation of identified issues
- Real-time monitoring and alerting
- Integration with third-party cost optimization tools (initially)

## Analysis Configuration

### Frequency
- **Scheduled Analysis**: Weekly execution by default
- **Ad-hoc Analysis**: On-demand execution capability for initial setup and testing

### Service Prioritization
Focus on AWS services that support Savings Plans and Reserved Instances, including but not limited to:
- Amazon EC2
- Amazon RDS
- Amazon Redshift
- Amazon ElastiCache
- Amazon OpenSearch Service
- Amazon DynamoDB

### UI/UX Principles & Reporting Format
- **Clean and Simple Design**: The user interface will prioritize clarity, ease of use, and a modern aesthetic, drawing inspiration from the provided UI mockups. A left-hand navigation bar will be used for primary navigation.
- **Concise Information**: Dashboards and reports will present information concisely, focusing on actionable insights and key metrics. Avoid information overload.
- **Web-based Dashboard**: Interactive HTML dashboard built with Next.js, React, TypeScript, and styled with Tailwind CSS and shadcn/ui components.
- **Self-contained**: The application will be deployable as a self-hosted solution with minimal external runtime dependencies beyond its core stack (e.g., database, queue).
- **Responsive Design**: Fully responsive and accessible on various devices (desktop, tablet, mobile).
- **Reporting Formats**: In addition to the interactive web dashboard, users will be able to export key reports to PDF and Excel/CSV formats.

### Partnerships
- **ProsperOps**: Planned integration for automated SP/RI management at scale

## Technical Architecture

### Core Technologies
- **Frontend Framework**: Next.js with React and TypeScript
  - Server-side rendering for better SEO and initial load
  - API routes for backend integration
  - Excellent developer experience

### UI & Styling
- **Component Library**: shadcn/ui
  - Built on Radix UI primitives for accessibility
  - Full customization to match brand guidelines
  - Excellent for complex interfaces and data tables
- **Styling**: Tailwind CSS
  - Utility-first CSS framework
  - Seamless integration with shadcn/ui

### Animation & Interactivity
- **Animation Library**: Framer Motion
  - Smooth, performant animations
  - Declarative animation API
  - Gesture support for interactive elements

### Data Visualization
- **Charts & Graphs**: Recharts
  - Composable charting library
  - Built on D3.js with React components
  - Excellent for cost analysis visualizations

### Backend & Infrastructure
- **Authentication**: Supabase Auth (Email/Password + Social Logins)
- **Database**: Supabase PostgreSQL
- **Payments**: Stripe Integration
- **Emails**: Resend
- **Analytics**: PostHog
- **Deployment**: Self-hosted on Hetzner
- **Containerization**: Docker
- **CI/CD**: GitHub Actions

### Project Structure
```
/my-app
├── /app                 # Next.js app router
├── /components          # Reusable UI components
├── /lib                 # Shared utilities and configs
├── /public              # Static assets
├── /styles              # Global styles and Tailwind config
├── /supabase           # Database migrations and types
├── /types              # TypeScript types
├── .env.local          # Local environment variables
├── next.config.js      # Next.js config
└── package.json
```



### Data Flow
1. **AWS Integration**
   - Single AWS account connection per team
   - Unique CloudFormation template per deployment
   - Read-only IAM role with least privilege

2. **Data Processing**
   - Periodic processing of CUR data (user-configurable schedule)
   - Raw data stored in S3
   - Aggregated metrics stored in Supabase for performance
   - 1-year data retention with manual deletion option

3. **Security**
   - All data encrypted at rest and in transit
   - Regular security audits
   - Auto-update mechanism for security patches

### Deployment Architecture
- **Development**: Local environment for development
- **Production**: Self-hosted on Hetzner
  - Automated daily database backups
  - Containerized deployment
  - Auto-update functionality

### Components
1. **Data Collection Layer**
   - AWS SDK integration for CUR data retrieval
   - Support for both scheduled and on-demand execution
   - Local caching of CUR data for performance

2. **Analysis Engine**
   - SP/RI coverage and optimization analysis
   - Orphaned resource detection
   - Cost savings calculations

3. **Web Dashboard**
   - Interactive visualizations
   - Export functionality for reports
   - Responsive design with Tailwind CSS

### Integration Points
- AWS Organizations for multi-account access
- ProsperOps API (future integration)
- AWS CUR S3 bucket access

## Development Workflow

### Branch Naming
- `feature/description` (new features)
- `fix/description` (bug fixes)
- `docs/description` (documentation)
- `refactor/description` (code refactoring)

## Screenshots
[If applicable]
