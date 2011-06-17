#!/bin/bash

source 000_config.sh

# ---------------- new app

cd  $TOP/tmp
rm -rf myapp
mkdir myapp

# ---------------- http://ryanflorence.com/deploying-with-capistrano-without-rails/

cd  $TOP/tmp/myapp

echo "Hi and stuff" > index.html

capify .
cp $TOP/src/Capfile $TOP/tmp/myapp/Capfile
cp $TOP/src/config/deploy.rb $TOP/tmp/myapp/config/deploy.rb
