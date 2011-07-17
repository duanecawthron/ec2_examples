#!/bin/bash

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`

cd $TOP
rm -rf tmp
cp -pr src tmp
rm -rf tmp/download

# ---------------- download and patch kaminari

$TOP/src/scripts/download.sh
if [ ! -d $TOP/tmp/kaminari ]; then
	cp -pr $TOP/src/download/kaminari $TOP/tmp/kaminari
	rm -rf $TOP/tmp/kaminari/.git # otherwise Capistrano will not copy the folder
	vim -s $TOP/src/scripts/add_skip_page_scope.vim $TOP/tmp/kaminari/lib/kaminari/models/page_scope_methods.rb
fi

# ---------------- deploy to server

../002_capistrano_norails/101_cap_deploy.sh tmp
