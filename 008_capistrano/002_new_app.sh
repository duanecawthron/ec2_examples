#!/bin/bash

source 000_config.sh

# ---------------- rails new app

cd  $TOP/tmp
rm -rf myapp
rails new myapp

# ---------------- replace Gemfile

cd  $TOP/tmp/myapp
mv Gemfile Gemfile.orig
cp ../Gemfile .
cp ../Gemfile.lock .

# ---------------- https://github.com/capistrano/capistrano/wiki/2.x-From-The-Beginning

# do not run capify since we replace the files
#   capify .
# creates
#   Capfile
#   config/deploy.rb

cp $TOP/src/Capfile $TOP/tmp/myapp
cp $TOP/src/config/deploy.rb $TOP/tmp/myapp/config/deploy.rb
