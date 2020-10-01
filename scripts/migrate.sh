#!/usr/bin/env bash
cd ../
source /home/ec2-user/www/project-venv/bin/activate
chmod +x ../manage.py
. /home/ec2-user/.bashrc
../manage.py makemigrations peterMusically
../manage.py migrate