#!/usr/bin/env bash
amazon-linux-extras install epel
yum install -y gcc-c++ flex supervisor 
amazon-linux-extras install nginx1
yum install python3 python3-pip
pip3 install -U virtualenv
