#!/bin/bash

source 000_config.sh

# ---------------- replace Gemfile

sed "s;TOP;$TOP/tmp;" < $TOP/src/Gemfile > $TOP/tmp/myapp/Gemfile

# ---------------- reset database

rake db:drop
rake db:create
rake db:migrate
