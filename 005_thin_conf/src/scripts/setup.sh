#!/bin/bash

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`
cd $TOP/..
TOP=`pwd`

[ "$USER" = "ec2-user" ] || { echo ERROR: must run as ec2-user; exit 1; }

[ -d scripts ]  || { echo ERROR: cannot find scripts in `pwd`; exit 1; }

# ---------------- Install config files
#
#   /etc/nginx/conf.d/myapp.conf
#   /etc/thin/myapp
#

sudo cp $TOP/etc/nginx_myapp.conf /etc/nginx/conf.d/myapp.conf

[[ -s "/usr/local/rvm/scripts/rvm" ]]     && . "/usr/local/rvm/scripts/rvm" # Load system RVM function if found
[[ -s "$HOME/.rvm/scripts/rvm" ]]         && . "$HOME/.rvm/scripts/rvm"     # Load user RVM function if found

rvm use 1.8.7@myapp

gem install bundler --no-rdoc --no-ri
bundle install

sudo mkdir -p /etc/thin
sudo chown -R ec2-user /etc/thin
thin config -C /etc/thin/myapp -c /u/myapp/current --servers 3 -e development
# or for caching, etc:
# thin config -C /etc/thin/myapp -c /u/myapp/current --servers 3 -e production
