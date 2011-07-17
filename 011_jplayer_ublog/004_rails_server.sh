#!/bin/bash

source 000_config.sh

# ---------------- replace Gemfile

sed "s;TOP;$TOP/tmp;" < $TOP/src/Gemfile > $TOP/tmp/myapp/Gemfile

# ---------------- use loalhost:3000 instead of live url

cat < $TOP/src/public/javascripts/application.js > $TOP/tmp/myapp/public/javascripts/application.js

# ---------------- run server

echo Browse to:
echo http://localhost:3000

rails server
