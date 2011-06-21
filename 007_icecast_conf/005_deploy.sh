#!/bin/bash

source 000_config.sh

# ---------------- https://github.com/capistrano/capistrano/wiki/2.x-From-The-Beginning

git init
git add .
git commit -m'initial commit'

cap deploy:setup
cap deploy:check
cap deploy:update

cap setup_icecast
cap restart_icecast
cap restart_mpd
cap play_test_song
