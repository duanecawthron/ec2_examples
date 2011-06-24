#!/bin/bash

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`

cd $TOP

cp -pr src/scripts tmp/myapp
rm -f tmp/scripts/deploy_gems.sh
../002_capistrano_norails/101_cap_deploy.sh tmp/myapp
