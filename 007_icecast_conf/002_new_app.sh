#!/bin/bash

source 000_config.sh

# ---------------- new app

cd  $TOP/tmp
rm -rf myapp
mkdir myapp

# ---------------- http://ryanflorence.com/deploying-with-capistrano-without-rails/

cd  $TOP/tmp/myapp

# do not run capify since we replace the files
#   capify .
# creates
#   Capfile
#   config/deploy.rb

cp -pr $TOP/src/* $TOP/tmp/myapp/
