#!/bin/bash

TOP=`dirname $0`
cd $TOP

cp -pr src/scripts tmp/myapp
../002_capistrano_norails/100_new_gemset.sh myapp
../002_capistrano_norails/000_cap_deploy.sh tmp/myapp
