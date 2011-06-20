#!/bin/bash

source 000_config.sh

# ---------------- https://github.com/capistrano/capistrano/wiki/2.x-From-The-Beginning

git init
git add .
git commit -m'initial commit'

cap deploy:setup
cap deploy:check
cap deploy:update

# call some example tasks in src/Capfile
cap echo_hostname
cap hostname
cap whoami
cap sudo_whoami
