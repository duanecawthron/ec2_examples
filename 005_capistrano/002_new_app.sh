#!/bin/bash

source 000_config.sh

# ---------------- rails new app

cd  $TOP/tmp
rm -rf myapp
rails new myapp

# ---------------- replace Gemfile

cd  $TOP/tmp/myapp
mv Gemfile Gemfile.orig
cp ../../src/Gemfile .

# ---------------- https://github.com/capistrano/capistrano/wiki/2.x-From-The-Beginning

cd  $TOP/tmp/myapp

capify .
cp $TOP/src/config/deploy.rb $TOP/tmp/myapp/config/deploy.rb
