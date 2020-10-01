#!/usr/bin/env bash

mkdir -p /etc/nginx/sites-enabled
mkdir -p /etc/nginx/sites-available

mkdir -p /etc/nginx/log/

cp scripts/nginx/default.conf /etc/nginx/nginx.conf

unlink /etc/nginx/sites-enabled/*

cp scripts/nginx/staging.conf /etc/nginx/sites-available/my-project-host.conf

ln -s /etc/nginx/sites-available/my-project-host.conf /etc/nginx/sites-enabled/my-project-host.conf

nginx -s reload
# sudo nginx -s start
