#!/usr/bin/env bash
cd /home/ec2-user/www/project/
source /home/ec2-user/www/project-venv/bin/activate
chmod +x ./manage.py
. /home/ec2-user/.bashrc
echo $DJANGO_SECRET_KEY > key3.log
./manage.py makemigrations peterMusically
./manage.py migrate