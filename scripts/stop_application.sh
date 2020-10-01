#!/usr/bin/env bash
# cd ./
# source /home/ec2-user/www/project-venv/bin/activate
# supervisorctl -c ./supervisor/default.conf stop all 2&>1 >/dev/null
# sudo unlink /tmp/supervisor.sock 2> /dev/null
sudo pkill supervisor*