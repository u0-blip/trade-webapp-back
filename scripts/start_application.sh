#!/usr/bin/env bash

cd /home/ec2-user/www/project/
source /home/ec2-user/www/project-venv/bin/activate
sudo mkdir -p /home/ec2-user/www/project/logs/
. /home/ec2-user/.bashrc
# echo yes | DJANGO_SETTINGS_MODULE=peterMusically.settings.staging SECRET_KEY=$DJANGO_SECRET_KEY /home/ec2-user/www/project/manage.py collectstatic
sudo pkill supervisor*
sudo chown -R ec2-user:ec2-user /home/ec2-user/www/project/logs
DJANGO_SETTINGS_MODULE=peterMusically.settings.dev SECRET_KEY=$DJANGO_SECRET_KEY supervisord -c /home/ec2-user/www/project/scripts/supervisor/default.conf 