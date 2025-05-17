#!/bin/sh

python manage.py migrate
python manage.py createadmin
exec "$@"
