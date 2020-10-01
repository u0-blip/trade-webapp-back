#!/usr/bin/env bash
cd /home/ec2-user/www/project/
source /home/ec2-user/www/project-venv/bin/activate
chmod +x ./manage.py
./manage.py makemigrations peterMusically
./manage.py migrate