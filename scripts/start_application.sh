#!/usr/bin/env bash

cd ../
source /home/ec2-user/www/project-venv/bin/activate
mkdir -p ../logs/
# echo yes | DJANGO_SETTINGS_MODULE=peterMusically.settings.staging SECRET_KEY=$DJANGO_SECRET_KEY ../manage.py collectstatic
DJANGO_SETTINGS_MODULE=peterMusically.settings.staging SECRET_KEY=$ENV_SECRET_KEY supervisord -c ../scripts/supervisor/default.conf 