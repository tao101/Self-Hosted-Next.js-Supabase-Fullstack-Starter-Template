# Self-Hosted Next.js & Supabase Fullstack Starter Template

A production-ready template for building modern web applications with Next.js and self-hosted Supabase. Designed for developers who want full control over their stack while maintaining rapid development capabilities. Optimized for deployment on Coolify.

Key Features:

- 🚀 Full-stack architecture with colocated frontend/backend
- 🔐 Self-hosted Supabase instance with automated migrations
- 🛡️ Enterprise-grade security patterns baked in
- 📊 Built-in observability with Sentry monitoring
- 📚 Auto-generated API documentation via Swagger
- ⚡ Lightning-fast development workflow with Legend State
- 🧪 Comprehensive testing suite (Playwright + Jest)
- 🔄 Real-time capabilities out-of-the-box

## Tech Stack

Here are the core technologies used in this project:

- 🚀 **Full-Stack Framework**: [Next.js](https://nextjs.org/) (App Router + API Routes)
- 🎨 **UI Components**: [Shadcn UI](https://ui.shadcn.com/) + [Tailwind CSS](https://tailwindcss.com/)
- 🗄️ **Database & Backend**: Self-hosted [Supabase](https://supabase.com/) (PostgreSQL, Auth, Storage)
- ⚡ **State Management**: [Legend State](https://legendapp.com/) for reactive state
- 📜 **API Docs**: Automated Swagger/OpenAPI documentation
- 🧪 **Testing**: [Playwright](https://playwright.dev/) E2E + [Jest](https://jestjs.io/) unit tests
- 🛡️ **Security**: Role-based access control & database RLS
- 📊 **Monitoring**: [Sentry](https://sentry.io/) error tracking
- 🔄 **Realtime**: Built-in Supabase realtime functionality

Key Features:

- Full-stack architecture with colocated frontend/backend
- Self-hosted Supabase instance with automated migrations
- Enterprise-grade security patterns
- Comprehensive testing suite
- Real-time capabilities out-of-the-box
- Developer-friendly DX with TypeScript & Zod

For complete architecture details, see the [Architecture Documentation](architecture.md).

## Getting Started

Follow these steps to get your local development environment set up:

1.  **Prerequisites**: Make sure you have [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/) installed. You'll also need the [Supabase CLI](https://supabase.com/docs/reference/cli/install) and [Docker Desktop](https://www.docker.com/products/docker-desktop/). Refer to the [Developer Documentation](documentation.md) for detailed instructions.

2.  **Clone the repository**:

    ```bash
    git clone <repository_url>
    cd <repository_name>
    ```

3.  **Install dependencies**:

    ```bash
    npm install
    ```

4.  **Start local Supabase**:

    ```bash
    supabase start
    ```

    This will start the Supabase stack in Docker.

5.  **Apply database migrations**:

    ```bash
    supabase db migrate up
    ```

6.  **Generate Supabase Typescript types**:

    ```bash
    npm run supabase:genTypes
    ```

7.  **Start the Next.js development server**:
    ```bash
    npm run dev
    ```
    Your application should now be running at `http://localhost:3000`.

For more detailed setup instructions, please see the [Project Setup](documentation.md#project-setup) section in the `documentation.md` file.

## Development Workflow

- **Branching**: Always create feature branches from the `staging` branch.
- **Local Testing**: Before creating a PR, run tests locally using `npm run test` to ensure all tests pass.
- **Pull Requests (PRs)**: Create PRs to merge feature branches into `staging`. Ensure all tests pass and code reviews are completed before merging.
- **Staging & Production**: The `staging` and `production` branches are automatically deployed to their respective environments via Coolify.

For a detailed development workflow, including branching and pull request guidelines, refer to the [Development Workflow Diagram](documentation.md#development-workflow-diagram) and [Branching and Pull Requests](documentation.md#branching-and-pull-requests) sections in `documentation.md`.

## Useful Scripts

Here are some helpful scripts from `package.json` for development:

- `npm run dev`: Starts the Next.js development server.
- `npm run build`: Builds the Next.js application for production.
- `npm run start`: Starts the Next.js production server.
- `npm run lint`: Runs ESLint for code linting.
- `npm run test`: Runs Playwright tests.
- `npm run supabase:genTypes`: Generates TypeScript types from your Supabase database schema.
- `npm run supabase:migrate`: Applies pending Supabase database migrations locally.
- `npm run ci:check`: Runs linting, tests, and generates Supabase types for CI checks.

See the [Package.json Scripts](documentation.md#packagejson-scripts) section in `documentation.md` for more details on available scripts.

## Documentation

For comprehensive documentation, including detailed setup instructions, deployment information, and coding conventions, please refer to [documentation.md](documentation.md).

Happy coding!
