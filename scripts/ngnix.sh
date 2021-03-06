#!/usr/bin/env bash

mkdir -p /etc/nginx/sites-enabled
mkdir -p /etc/nginx/sites-available

mkdir -p /etc/nginx/log/

cp /home/ec2-user/www/project/scripts/nginx/default.conf /etc/nginx/nginx.conf

unlink /etc/nginx/sites-enabled/*

cp /home/ec2-user/www/project/scripts/nginx/staging.conf /etc/nginx/sites-available/my-project-host.conf

ln -s /etc/nginx/sites-available/my-project-host.conf /etc/nginx/sites-enabled/my-project-host.conf

sudo service nginx start
sudo service nginx reload
# sudo nginx -s start
