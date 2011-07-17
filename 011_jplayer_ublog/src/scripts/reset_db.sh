#!/bin/bash

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`
cd $TOP/..
TOP=`pwd`

[ "$USER" = "ec2-user" ] || { echo ERROR: must run as ec2-user; exit 1; }

[ -d scripts ]  || { echo ERROR: cannot find scripts in `pwd`; exit 1; }

[[ -s "/usr/local/rvm/scripts/rvm" ]]     && . "/usr/local/rvm/scripts/rvm" # Load system RVM function if found
[[ -s "$HOME/.rvm/scripts/rvm" ]]         && . "$HOME/.rvm/scripts/rvm"     # Load user RVM function if found

rvm use 1.8.7@myapp

# ---------------- reset database

rake db:drop
rake db:create
rake db:migrate
