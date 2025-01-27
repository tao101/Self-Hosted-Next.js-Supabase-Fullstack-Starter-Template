# Architecture

This document outlines the architecture of the SaaS template project, built with Next.js and self-hosted Supabase, designed for deployment on Coolify. The primary focus is on developer experience (DX) and a rapid development cycle.

## Core Components

1.  **Frontend (Next.js):**

    - Handles user interface and user interactions.
    - Built using React, TypeScript, Tailwind CSS, and Shadcn UI.
    - Utilizes server-side rendering (SSR) and static site generation (SSG) where appropriate for performance and SEO.
    - Manages application state using a state management library (e.g., Legend State).

2.  **Backend (Next.js Actions & API Routes):**

    - **Next.js Actions:** Used for server-side logic that interacts directly with Supabase. These are colocated with React components for ease of development and deployment. Ideal for actions triggered by user interactions within the frontend (e.g., form submissions, data mutations).
    - **Next.js API Routes:** Provide a traditional API layer for functionalities that need to be exposed beyond the Next.js frontend. This is useful for:
      - Third-party integrations (e.g., mobile apps, external websites).
      - Webhooks.
      - Scheduled tasks (if needed, orchestrated externally or using edge functions).

3.  **Database (Self-hosted Supabase):**
    - Provides a complete backend-as-a-service (BaaS) solution.
    - Handles database management (PostgreSQL), authentication, storage, and real-time functionality.
    - Self-hosted on Coolify for full control and customization.
    - Managed using Supabase CLI for local development and migrations.

## Architecture Diagram

```mermaid
graph LR
subgraph Next.js Application
A[Frontend (React, Next.js)]
subgraph Backend
B[Next.js Actions]
C[Next.js API Routes]
end
end
D[Self-hosted Supabase]
A --> B & C
B & C --> D
style A fill:#f9f,stroke:#333,stroke-width:2px
style D fill:#ccf,stroke:#333,stroke-width:2px
```

## Development Workflow

1.  **Local Development:**

    - Each developer sets up a local Supabase instance using the Supabase CLI. This ensures an isolated and consistent development environment.
    - Next.js application connects to the local Supabase instance.
    - Code changes and Supabase migrations are developed and tested locally.

2.  **Branching Strategy:**

    - **`staging` branch:** Represents the staging environment. Feature branches are created from and merged into this branch.
    - **`production` branch:** Represents the production environment. Staging branch is merged into production after thorough testing and approval.
    - **Feature branches:** Developers create feature branches from `staging` for each new feature, task, or bug fix. Branch names should be descriptive (e.g., `feature/user-profiles`, `fix/login-bug`).

3.  **Pull Requests (PRs) and Merging:**

    - Once a feature is complete and tested locally, developers create a Pull Request (PR) to merge their feature branch into the `staging` branch.
    - **Code Review:** PRs undergo code review by other developers to ensure code quality and catch potential issues.
    - **Automated Testing:** Upon PR creation, automated tests (unit tests, integration tests - if implemented) are run.
    - **Supabase Migrations:** If the feature includes database schema changes, a Supabase migration script is included in the PR.

4.  **Staging Deployment:**

    - After successful code review, automated tests, and migration application, the PR is merged into the `staging` branch.
    - **Automated Deployment to Staging on Coolify:** Coolify is configured to automatically deploy the `staging` branch to the staging environment upon merge.
    - **Migration Execution on Staging:** As part of the staging deployment process (ideally _before_ the new application version is live), Supabase migrations are automatically applied to the staging Supabase instance. _(See "Supabase Migrations in Coolify Deployments" below)_

5.  **Production Deployment:**
    - After successful testing and validation in the staging environment, the `staging` branch is merged into the `production` branch.
    - **Automated Deployment to Production on Coolify:** Coolify automatically deploys the `production` branch to the production environment upon merge.
    - **Migration Execution on Production:** Similar to staging, Supabase migrations are automatically applied to the production Supabase instance as part of the production deployment process. _(See "Supabase Migrations in Coolify Deployments" below)_

## Supabase Migrations in Coolify Deployments

To ensure database migrations are run before each deployment in Coolify _without modifying `coolify.yml`_, you can leverage Coolify's **deployment scripts**. Specifically, you would use a **Post-deploy script**.

Here's the general approach:

1.  **Create a Migration Script:** Create a script (e.g., `migrate.sh`) in your project root that uses the Supabase CLI to apply migrations. This script would typically look like this:

    ```bash
    #!/bin/bash
    supabase db migrate up
    ```

    Make sure this script is executable (`chmod +x migrate.sh`).

2.  **Configure Coolify Post-deploy Script:** In your Coolify application settings, configure a **Post-deploy script**. Set the script path to `/app/migrate.sh` (assuming your project root in the Coolify container is `/app`).

**How it works:**

- During deployment, Coolify will first deploy the new application code.
- _After_ the code deployment is complete, Coolify will execute the Post-deploy script (`migrate.sh`).
- The `migrate.sh` script will use the Supabase CLI (which needs to be available in your Coolify deployment environment - see "Package.json Scripts" and "Coolify Environment Setup" in `documentation.md`) to apply any pending migrations to your Supabase database.
- This ensures that the database schema is always up-to-date _before_ the newly deployed application starts serving traffic.

**Important Considerations:**

- **Supabase CLI in Coolify Environment:** Ensure the Supabase CLI is installed and available in your Coolify deployment environment. You might need to include installation steps in your Dockerfile or Coolify build process. _(This will be covered in `documentation.md`)_
- **Environment Variables:** Your `migrate.sh` script will need access to the necessary Supabase environment variables (e.g., `SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY`) to connect to your Supabase database. Configure these in your Coolify environment variables settings.
- **Idempotency:** Supabase migrations are designed to be idempotent. Running `supabase db migrate up` multiple times will only apply new migrations, so it's safe to run this script on each deployment.
- **Error Handling:** Enhance the `migrate.sh` script with error handling to gracefully manage migration failures and potentially rollback deployments if necessary.

## Technologies Used

- **Next.js:** React framework for frontend and backend.
- **React:** JavaScript library for building user interfaces.
- **TypeScript:** Superset of JavaScript that adds static typing.
- **Tailwind CSS:** Utility-first CSS framework.
- **Shadcn UI:** Reusable UI components built with Radix UI and Tailwind CSS.
- **Zod:** Schema validation library for TypeScript.
- **Supabase:** Open-source Firebase alternative (PostgreSQL, Auth, Storage, Realtime).
- **Supabase CLI:** Command-line tool for managing Supabase projects.
- **Coolify:** Open-source PaaS for deploying applications.
- **Jest:** JavaScript testing framework.
- **Legend State:** (Example) State management library for React.

## DX and Faster Development Cycle Focus

This architecture is designed to prioritize:

- **Rapid Iteration:** Next.js and Supabase provide a fast development loop, allowing developers to quickly build and deploy features.
- **Developer Friendliness:** TypeScript, Zod, Tailwind CSS, and Shadcn UI enhance code quality, maintainability, and ease of development.
- **Simplified Deployment:** Coolify automates deployment processes, reducing deployment friction.
- **Local Development Consistency:** Supabase CLI ensures consistent local development environments, minimizing "works on my machine" issues.
- **Clear Workflow:** Defined branching and PR strategies streamline collaboration and code management.

By focusing on these aspects, the SaaS template aims to provide a solid foundation for building and scaling applications efficiently.
