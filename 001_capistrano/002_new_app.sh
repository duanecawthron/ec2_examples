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

# ---------------- http://ryanflorence.com/deploying-with-capistrano-without-rails/

cd  $TOP/tmp/myapp

echo "Hi and stuff" > index.html

capify .
cp $TOP/src/config/deploy.rb $TOP/tmp/myapp/config/deploy.rb
