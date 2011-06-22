#!/bin/bash

# ---------------- delete files

TOP=`dirname $0`
cd $TOP
rm -rf $TOP/tmp

# ---------------- delete gemset

rvm gemset use global
rvm --force gemset delete norails
