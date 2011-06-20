#!/bin/bash

[ "$USER" = "root" ] || { echo ERROR: must run as root; exit 1; }

yum -y install git.i686

bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
chown -R ec2-user /usr/local/rvm
