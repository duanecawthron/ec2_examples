#!/bin/bash

source 000_config.sh

# ---------------- https://github.com/capistrano/capistrano/wiki/2.x-From-The-Beginning

git init
git add .
git commit -m'initial commit'

cap deploy:setup
cap deploy:check
cap deploy:update

# ---------------- install nginx package

cap yum_nginx

# ---------------- run server

cap start_nginx

echo Browse to:
echo http://ec2-50-17-56-198.compute-1.amazonaws.com
