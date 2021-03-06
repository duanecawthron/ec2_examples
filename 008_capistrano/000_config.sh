#!/bin/bash

PROJECT=myapp

[[ -s "/usr/local/rvm/scripts/rvm" ]]     && . "/usr/local/rvm/scripts/rvm" # Load system RVM function if found
[[ -s "$HOME/.rvm/scripts/rvm" ]]         && . "$HOME/.rvm/scripts/rvm"     # Load user RVM function if found

rvm gemset use global
rvm gemset create $PROJECT
rvm use 1.8.7@$PROJECT

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`

mkdir -p $TOP/tmp/myapp
cd $TOP/tmp/myapp
