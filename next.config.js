const { verifyEnvVars } = require("./check-env-vars");

/** @type {import('next').NextConfig} */
const nextConfig = {};

verifyEnvVars();

module.exports = nextConfig;
