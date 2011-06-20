#!/bin/bash

[ "$USER" = "ec2-user" ] || { echo ERROR: must run as ec2-user; exit 1; }

source 000_config.sh
source /etc/profile.d/rvm.sh

# ---------------- delete files

cd /u
sudo rm -rf /u/$PROJECT

# ---------------- delete gemset

rvm gemset use global
rvm --force gemset delete $PROJECT