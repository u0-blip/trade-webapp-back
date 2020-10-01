#!/usr/bin/env bash
virtualenv -p python3 /home/ec2-user/www/project-venv 
source /home/ec2-user/www/project-venv/bin/activate
pip install -r ../requirements.txt