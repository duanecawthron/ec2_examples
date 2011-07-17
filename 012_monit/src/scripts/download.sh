#!/bin/bash

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`
cd $TOP/..
TOP=`pwd`

[ -d scripts ]  || { echo ERROR: cannot find scripts in `pwd`; exit 1; }

mkdir -p download
cd download

[ -f monit-5.2.5.tar.gz ] || \
wget --no-verbose http://mmonit.com/monit/dist/monit-5.2.5.tar.gz
