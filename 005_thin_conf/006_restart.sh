#!/bin/bash

TOP=`dirname $0`
cd $TOP

rm -rf tmp
cp -pr src tmp
rm -f tmp/scripts/deploy_gems.sh
../002_capistrano_norails/000_cap_deploy.sh tmp