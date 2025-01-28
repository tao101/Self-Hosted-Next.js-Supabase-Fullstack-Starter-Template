import swaggerJSDoc from "swagger-jsdoc";

export const PUBLIC_API_ROUTES = ["/api/health"];

const options = {
  definition: {
    openapi: "3.0.0",
    info: {
      title: "API Documentation",
      version: "1.0.0",
      description: "API documentation for the SaaS project",
    },
    servers: [
      {
        url: process.env.NEXT_PUBLIC_FRONTEND_URL,
        description: "Endpoint url",
      },
    ],
    components: {
      securitySchemes: {
        bearerAuth: {
          type: "http",
          scheme: "bearer",
          bearerFormat: "JWT",
        },
      },
    },
  },
  apis:
    process.env.NODE_ENV == "development"
      ? ["./app/api/**/*.ts"]
      : PUBLIC_API_ROUTES, // Path to your API routes
};

export const swaggerSpec = swaggerJSDoc(options);
