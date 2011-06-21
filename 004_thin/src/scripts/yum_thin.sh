#!/bin/bash

set -v

yum -y install gcc.i686
yum -y install make.i686
yum -y install ruby-devel.i686
yum -y install gcc-c++.i686


exit 0
yum -y install openssl.i686
yum -y install openssl-devel.i686

# I ran this to install ruby dependencies, as per instructions in `rvm notes`
sudo yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel

