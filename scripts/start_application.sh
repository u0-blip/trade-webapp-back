#!/usr/bin/env bash

cd /home/ec2-user/www/project/
source /home/ec2-user/www/project-venv/bin/activate
mkdir -p /home/ec2-user/www/project/logs/
# echo yes | DJANGO_SETTINGS_MODULE=peterMusically.settings.staging SECRET_KEY=$DJANGO_SECRET_KEY /home/ec2-user/www/project/manage.py collectstatic
DJANGO_SETTINGS_MODULE=peterMusically.settings.staging SECRET_KEY=$DJANGO_SECRET_KEY supervisord -c /home/ec2-user/www/project/scripts/supervisor/default.conf