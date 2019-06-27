#!/bin/bash

python3 /Wendao/backend/manage.py collectstatic --noinput&&
python3 /Wendao/backend/manage.py makemigrations&&
python3 /Wendao/backend/manage.py migrate&&

gunicorn -c /gunicorn.py backend.wsgi
