#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Run database migrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

# Start Gunicorn server
exec "$@"