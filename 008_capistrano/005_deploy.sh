#!/bin/bash

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`

cd $TOP

cp -pr src/scripts tmp/myapp
../002_capistrano_norails/100_new_gemset.sh myapp
../002_capistrano_norails/100_cap_deploy.sh tmp/myapp
