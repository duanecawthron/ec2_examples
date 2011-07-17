#!/bin/bash

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`
cd $TOP/..
TOP=`pwd`

[ "$USER" = "ec2-user" ] || { echo ERROR: must run as ec2-user; exit 1; }

[ -d scripts ]  || { echo ERROR: cannot find scripts in `pwd`; exit 1; }

# ---------------- Install config files
#
#   /etc/nginx/conf.d/myapp.conf
#   /etc/thin/myapp
#

sudo /sbin/service nginx stop
/sbin/service thin stop

[ $TOP/etc/nginx.conf.1 ] || sudo mv $TOP/etc/nginx.conf $TOP/etc/nginx.conf.1
sudo cp $TOP/etc/nginx.conf /etc/nginx/nginx.conf
sudo cp $TOP/etc/nginx_myapp.conf /etc/nginx/conf.d/myapp.conf

sudo mkdir -p /etc/thin
sudo chown -R ec2-user /etc/thin
thin config -C /etc/thin/myapp -c /u/myapp/current --servers 1 -e development
# or for caching, etc:
# thin config -C /etc/thin/myapp -c /u/myapp/current --servers 3 -e production
