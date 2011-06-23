#!/bin/bash
#
# usage: 000_cap_deploy.sh <folder>
#
# Use Capistrano to deploy a folder to a server and run deployment scripts
#   <folder>/Capfile					# (required) Capistrano configuration
#   <folder>/config/deploy.rb			# (required) Capistrano configuration
#   <folder>/scripts/deploy_gems.sh		# (optional) install yum packages and gems on the server
#   <folder>/scripts/deploy_app.sh		# (optional) install the appllicatin on the server
#   <folder>/more_stuff
#

[ -d $1 ] || { echo ERROR: cannot find $1; exit 1; }
cd $1
[ -f Capfile ] || { echo ERROR: cannot find Capfile in `pwd`; exit 1; }
[ -f config/deploy.rb  ] || { echo ERROR: cannot find config/deploy.rb in `pwd`; exit 1; }

[[ -s "/usr/local/rvm/scripts/rvm" ]]     && . "/usr/local/rvm/scripts/rvm" # Load system RVM function if found
[[ -s "$HOME/.rvm/scripts/rvm" ]]         && . "$HOME/.rvm/scripts/rvm"     # Load user RVM function if found

rvm gemset use global
rvm gemset create norails
rvm use 1.8.7@norails

gem install capistrano --no-rdoc --no-ri
gem install railsless-deploy --no-rdoc --no-ri

# ---------------- https://github.com/capistrano/capistrano/wiki/2.x-From-The-Beginning

git init
git add .
git commit -m'initial commit'

cap deploy:setup
cap deploy:check
cap deploy:update

# ---------------- install yum packages and gems on the server

[ -x ./scripts/deploy_gems.sh ] && ./scripts/deploy_gems.sh

# ---------------- install the appllicatin on the server

[ -x ./scripts/deploy_app.sh ] && ./scripts/deploy_app.sh
