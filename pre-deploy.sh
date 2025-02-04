#!/bin/sh
set -e # Exit immediately if any command fails
# Check for required environment variables
if [ -z "$SUPABASE_DB_URL" ]; then
  echo "❌ Error: SUPABASE_DB_URL environment variable is not set"
  exit 1
fi
echo "🔧 Starting pre-deployment checks"
echo "--------------------------------"
echo "📦 Database URL: ${SUPABASE_DB_URL}"
# Apply database migrations
echo "🔄 Applying database migrations..."
npx supabase db push --db-url="$SUPABASE_DB_URL" || {
  echo "❌ Migration failed"
  exit 1
}
echo "✅ Pre-deployment checks completed successfully" 