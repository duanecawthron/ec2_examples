#!/bin/bash

TOP=`dirname $0`
cd $TOP

rm -rf tmp
cp -pr src tmp
../002_capistrano_norails/100_new_gemset.sh thin
../002_capistrano_norails/000_cap_deploy.sh tmp
