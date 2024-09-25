#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Wait for the database to be ready
echo "Waiting for the database to be ready..."
while ! nc -z $DB_HOST $DB_PORT; do
  sleep 1
done
echo "Database is ready!"

# Apply database migrations
echo "Applying database migrations..."
python manage.py migrate

# Collect static files (in production mode)
if [ "$DJANGO_ENV" = "production" ]; then
  echo "Collecting static files..."
  python manage.py collectstatic --noinput
fi

# Start the Django server
echo "Starting Django server..."
exec "$@"
