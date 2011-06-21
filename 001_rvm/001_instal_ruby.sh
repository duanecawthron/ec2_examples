#!/bin/bash

[ "$USER" = "ec2-user" ] || { echo ERROR: must run as ec2-user; exit 1; }

source /etc/profile.d/rvm.sh

sudo yum -y install gcc.i686
sudo yum -y install make.i686

# rvm package -h
#   Usage:
#   'rvm package {install,uninstall} {readline,iconv,curl,openssl,zlib,autoconf,ncurses,pkgconfig,gettext,glib,mono,llvm,libxml2,libxslt,libyaml}'
#   'ree_dependencies' installs zlib, ncurses, readline, openssl and iconv in this order.
#   still need to add ' --with-readline-dir=$rvm_usr_path --with-iconv-dir=$rvm_usr_path --with-zlib-dir=$rvm_usr_path --with-openssl-dir=$rvm_usr_path' to 'rvm install ree'
#
# NOTE: Below uses $rvm_path/usr. Above uses $rvm_usr_path. It is not defined.

rvm package install zlib
rvm package install openssl		# required by thin
rvm remove 1.8.7
rvm install 1.8.7 --with-zlib-dir=$rvm_path/usr --with-openssl-dir=$rvm_path/usr
