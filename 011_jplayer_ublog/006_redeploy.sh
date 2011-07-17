#!/bin/bash

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`

cd $TOP

# ---------------- replace Gemfile

sed "s;TOP;/u/kaminari/current;" < $TOP/src/Gemfile > $TOP/tmp/myapp/Gemfile

# ---------------- change loalhost:3000 to live url

sed "s;localhost:3000;ec2-184-72-84-255.compute-1.amazonaws.com;" \
	< $TOP/src/public/javascripts/application.js > $TOP/tmp/myapp/public/javascripts/application.js

# ---------------- deploy to server

cp -pr src/scripts tmp/myapp
rm -f tmp/scripts/deploy_gems.sh
../002_capistrano_norails/101_cap_deploy.sh tmp/myapp
