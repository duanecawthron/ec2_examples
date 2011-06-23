#!/bin/bash

[ "$USER" = "root" ] || { echo ERROR: must run as root; exit 1; }

set -v

yum -y install gcc.i686
yum -y install make.i686
yum -y install ruby-devel.i686
yum -y install gcc-c++.i686
