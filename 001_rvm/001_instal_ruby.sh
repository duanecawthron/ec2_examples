#!/bin/bash

[ "$USER" = "ec2-user" ] || { echo ERROR: must run as ec2-user; exit 1; }

source /etc/profile.d/rvm.sh

sudo yum -y install gcc.i686
sudo yum -y install make.i686

rvm package install zlib
rvm remove 1.8.7
rvm install 1.8.7 --with-zlib-dir=$rvm_path/usr
