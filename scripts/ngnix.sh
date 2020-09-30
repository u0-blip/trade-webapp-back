#!/usr/bin/env bash

sudo mkdir -p /etc/nginx/sites-enabled
sudo mkdir -p /etc/nginx/sites-available

sudo mkdir -p /etc/nginx/log/

sudo cp scripts/nginx/default.conf /etc/nginx/nginx.conf

sudo unlink /etc/nginx/sites-enabled/*

sudo cp scripts/nginx/staging.conf /etc/nginx/sites-available/my-project-host.conf

sudo ln -s /etc/nginx/sites-available/my-project-host.conf /etc/nginx/sites-enabled/my-project-host.conf

sudo nginx -s reload
# sudo nginx -s start
