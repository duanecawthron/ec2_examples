#!/bin/bash

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`

cd $TOP

rm -rf tmp
cp -pr src tmp
pwd
ls ../002_capistrano_norails
ls -l ../002_capistrano_norails/101_cap_deploy.sh



rm -rf tmp
cp -pr src tmp
../002_capistrano_norails/101_cap_deploy.sh tmp