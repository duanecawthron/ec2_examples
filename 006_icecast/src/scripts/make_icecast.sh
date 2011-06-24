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

tar -zxf ../download/icecast-2.3.2.tar.gz
tar -zxf ../download/libshout-2.2.2.tar.gz
tar -zxf ../download/lame-3.98.4.tar.gz
tar -zxf ../download/libmad-0.15.1b.tar.gz
tar -jxf ../download/libmpdclient-2.4.tar.bz2
tar -jxf ../download/mpc-0.20.tar.bz2
tar -jxf ../download/mpd-0.16.2.tar.bz2
tar -jxf ../download/ncmpc-0.18.tar.bz2

for name in libmpdclient-2.4 libmad-0.15.1b lame-3.98.4 libshout-2.2.2
do
	cd $TOP/tmp
	[ -d $name ] || { echo ERROR: cannot find $name in `pwd`; exit 1; }
	cd $name
	./configure --prefix=/usr
	make
	make install
done

for name in icecast-2.3.2 mpc-0.20 mpd-0.16.2 ncmpc-0.18
do
	cd $TOP/tmp
	[ -d $name ] || { echo ERROR: cannot find $name in `pwd`; exit 1; }
	cd $name
	./configure
	make
	make install
done
