#!/bin/bash

[[ -s "/usr/local/rvm/scripts/rvm" ]]     && . "/usr/local/rvm/scripts/rvm" # Load system RVM function if found
[[ -s "$HOME/.rvm/scripts/rvm" ]]         && . "$HOME/.rvm/scripts/rvm"     # Load user RVM function if found

# ---------------- delete files

TOP=`dirname $0`
cd $TOP
rm -rf $TOP/tmp

# ---------------- delete gemset

rvm gemset use global
rvm --force gemset delete norails
