#!/bin/bash

[ "$USER" = "root" ] || { echo ERROR: must run as root; exit 1; }

set -v

yum -y install sqlite.i686
yum -y install sqlite-devel.i686
