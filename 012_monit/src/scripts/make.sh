#!/bin/bash

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`
cd $TOP/..
TOP=`pwd`

[ -d download ] || { echo ERROR: cannot find download in `pwd`; exit 1; }
[ -d scripts ]  || { echo ERROR: cannot find scripts in `pwd`; exit 1; }

rm -rf tmp
mkdir -p tmp
cd tmp

tar -zxf ../download/monit-5.2.5.tar.gz

for name in monit-5.2.5
do
	cd $TOP/tmp
	[ -d $name ] || { echo ERROR: cannot find $name in `pwd`; exit 1; }
	cd $name
	./configure --without-ssl
	make
	make install
done
