#!/bin/bash

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`

cd $TOP

rm -rf tmp
cp -pr src tmp
../002_capistrano_norails/100_new_gemset.sh myapp
../002_capistrano_norails/101_cap_deploy.sh tmp
