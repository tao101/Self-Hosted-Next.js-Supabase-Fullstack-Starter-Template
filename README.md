# Welcome to the SaaS Template Project!

This template is designed to kickstart your SaaS application development with a focus on developer experience and a rapid development cycle. It's built using Next.js and self-hosted Supabase, and is designed for easy deployment on Coolify.

## Tech Stack

Here are the core technologies used in this project:

- **Frontend & Backend**: [Next.js](https://nextjs.org/) (React framework)
- **Styling**: [Tailwind CSS](https://tailwindcss.com/) with [Shadcn UI](https://ui.shadcn.com/) component library
- **State Management**: [Legend State](https://legendapp.com/)
- **Database & Backend Services**: [Supabase](https://supabase.com/) (PostgreSQL, Authentication, Storage, Realtime)
- **API Documentation**: [Swagger](https://swagger.io/)
- **Testing**: [Jest](https://jestjs.io/) and [Playwright](https://playwright.dev/)
- **Deployment**: [Coolify](https://coolify.io/)
- **Error Tracking & Monitoring**: [Sentry](https://sentry.io/)
- **Typescript**: [Typescript](https://www.typescriptlang.org/)
- **Schema Validation**: [Zod](https://zod.dev/)

For a complete list, see the [Architecture Documentation](architecture.md).

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
