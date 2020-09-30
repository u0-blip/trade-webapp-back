#!/usr/bin/env bash
yum install -y gcc-c++ flex supervisor
amazon-linux-extras install epel
amazon-linux-extras install nginx1
yum install python3 python3-pip
pip3 install -U virtualenv
