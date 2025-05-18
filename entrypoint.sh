#!/bin/bash
set -e
set -x

echo "Applying database migrations..."
python manage.py migrate

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Creating superuser if needed..."
python manage.py createadmin

echo "Starting application..."
exec gunicorn portfolio.wsgi:application --bind 0.0.0.0:8000
