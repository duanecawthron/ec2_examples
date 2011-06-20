#!/bin/bash

[ "$USER" = "ec2-user" ] || { echo ERROR: must run as ec2-user; exit 1; }

source 000_config.sh
source /etc/profile.d/rvm.sh

rvm gemset use global
rvm gemset create $PROJECT
rvm use 1.8.7@$PROJECT

gem install capistrano --no-rdoc --no-ri

sudo mkdir -p /u
sudo chown ec2-user /u

[ -f /etc/sudoers.orig ] || sudo cp -p /etc/sudoers /etc/sudoers.orig
sudo vim -s comment_out_requiretty.vim /etc/sudoers
