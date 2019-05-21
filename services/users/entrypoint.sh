#!/bin/sh

echo "Waiting for postgres..."

while ! nc -z users-db 5432; do
  sleep 0.1
done

echo "PostgreSQL started"

echo "gunicorn --access-logfile - --error-logfile - --log-level info -k gevent -w 4 manage:app"
exec gunicorn -b 0.0.0.0:5000 manage:app

