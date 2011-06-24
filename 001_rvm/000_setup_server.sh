#!/bin/bash

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`

cd $TOP

ssh -i ~/.ssh/server001keypair.pem ec2-user@ec2-184-73-143-111.compute-1.amazonaws.com sudo whoami
if [ "$?" -ne 0 ]; then
	echo Before you can run this script, you must:
	echo ssh -i ~/.ssh/server001keypair.pem ec2-user@ec2-184-73-143-111.compute-1.amazonaws.com
	echo sudo bash
	echo edit /etc/sudoers
	echo comment out: Default requiretty
	exit 1
fi

set -v

scp -pr -i ~/.ssh/server001keypair.pem server ec2-user@ec2-184-73-143-111.compute-1.amazonaws.com:/tmp
ssh -i ~/.ssh/server001keypair.pem ec2-user@ec2-184-73-143-111.compute-1.amazonaws.com sudo bash /tmp/server/000_install_rvm.sh
ssh -i ~/.ssh/server001keypair.pem ec2-user@ec2-184-73-143-111.compute-1.amazonaws.com bash /tmp/server/001_instal_ruby.sh
