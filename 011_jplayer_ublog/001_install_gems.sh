#!/bin/bash

source 000_config.sh

# ---------------- download and patch kaminari

$TOP/src/scripts/download.sh
if [ ! -d $TOP/tmp/kaminari ]; then
	cp -pr $TOP/src/download/kaminari $TOP/tmp/kaminari
	vim -s $TOP/src/scripts/add_skip_page_scope.vim $TOP/tmp/kaminari/lib/kaminari/models/page_scope_methods.rb
fi

# ---------------- replace Gemfile

sed "s;TOP;$TOP/tmp;" < $TOP/src/Gemfile > $TOP/tmp/Gemfile

# ---------------- install gems and use local copy of kaminari

cd $TOP/tmp
gem install bundler --no-rdoc --no-ri

# Must reload RVM. Otherwise, bundle install fails
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
bundle install
