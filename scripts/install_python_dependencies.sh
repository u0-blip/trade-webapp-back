#!/usr/bin/env bash
[ ! -d "/home/ec2-user/www/project-venv" ] && virtualenv -p python3 /home/ec2-user/www/project-venv 
source /home/ec2-user/www/project-venv/bin/activate
pip install -r /home/ec2-user/www/project/requirements.txt