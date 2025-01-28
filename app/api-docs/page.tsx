import SwaggerUI from "swagger-ui-react";
import "swagger-ui-react/swagger-ui.css";
import { swaggerSpec } from "@/utils/api-docs";

export default function APIDocs() {
  return <SwaggerUI spec={swaggerSpec} />;
}
