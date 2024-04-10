#!/bin/bash

sudo apt update

sudo apt install -y python3 python3-pip

pip3 install flask flask-restful

git clone https://github.com/Akshay771/flask_nginx_lb.git

cd flask_nginx_lb

nohup python3 app.py &