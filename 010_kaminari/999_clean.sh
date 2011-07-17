#!/bin/bash

# ---------------- delete files

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`

cd $TOP
rm -rf $TOP/tmp
