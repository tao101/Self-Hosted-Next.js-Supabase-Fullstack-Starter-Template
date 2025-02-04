import SwaggerUI from 'swagger-ui-react';
import 'swagger-ui-react/swagger-ui.css';
import { swaggerSpec } from '@/utils/api-docs';

export const dynamic = 'force-dynamic';

export default function APIDocs() {
  return <SwaggerUI spec={swaggerSpec} />;
}
