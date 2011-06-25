#!/bin/bash

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`
cd $TOP/..
TOP=`pwd`

ssh -i ~/.ssh/server001keypair.pem ec2-user@ec2-184-72-84-255.compute-1.amazonaws.com sudo whoami
if [ "$?" -ne 0 ]; then
	echo Before you can run this script, you must:
	echo ssh -i ~/.ssh/server001keypair.pem ec2-user@ec2-184-72-84-255.compute-1.amazonaws.com
	echo sudo bash
	echo edit /etc/sudoers
	echo comment out: Default requiretty
	exit 1
fi

set -v

cd   $TOP/001_rvm
bash 000_setup_server.sh

cd   $TOP/002_capistrano_norails
bash 000_setup_server.sh

cd   $TOP/003_nginx
bash 005_deploy.sh
bash 999_clean.sh

cd   $TOP/004_thin
bash 005_deploy.sh

bash 999_clean.sh

cd   $TOP/005_thin_conf
bash 005_deploy.sh
bash 999_clean.sh

cd   $TOP/006_icecast
bash 005_deploy.sh
bash 999_clean.sh

cd   $TOP/007_icecast_conf
bash 005_deploy.sh
bash 999_clean.sh

cd   $TOP/009_jplayer
bash 001_install_gems.sh
bash 002_new_app.sh
bash 003_reset_database.sh
bash 005_deploy.sh
bash 999_clean.sh
