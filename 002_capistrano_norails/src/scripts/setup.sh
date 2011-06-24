#!/bin/bash

[ "$USER" = "ec2-user" ] || { echo ERROR: must run as ec2-user; exit 1; }

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`

# create the folder where we will deploy apps
sudo mkdir -p /u
sudo chown ec2-user /u

if [ ! -f /etc/sudoers.orig ]; then
	# comment out Default requiretty to avoid "sorry, you must have a tty to run sudo"
	sudo cp -p /etc/sudoers /etc/sudoers.orig
	sudo vim -s $TOP/comment_out_requiretty.vim /etc/sudoers
fi
