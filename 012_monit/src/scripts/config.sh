#!/bin/bash

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`
cd $TOP/..
TOP=`pwd`

[ "$USER" = "root" ] || { echo ERROR: must run as root; exit 1; }

[ -d scripts ]  || { echo ERROR: cannot find scripts in `pwd`; exit 1; }

# ---------------- Install config files
#
#   /etc/monitrc
#

# stop monit
/usr/local/bin/monit quit

# udpate config file
cp $TOP/etc/monitrc /etc
chmod 700 /etc/monitrc

# start monit
/usr/local/bin/monit
