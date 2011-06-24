#!/bin/bash

source 000_config.sh

# ---------------- rails new app

cd  $TOP/tmp
rm -rf myapp
rails new myapp

# ---------------- replace Gemfile

cd  $TOP/tmp/myapp
mv Gemfile Gemfile.orig
cp ../Gemfile .
cp ../Gemfile.lock .

# ---------------- https://github.com/capistrano/capistrano/wiki/2.x-From-The-Beginning

# do not run capify since we replace the files
#   capify .
# creates
#   Capfile
#   config/deploy.rb

cp $TOP/src/Capfile $TOP/tmp/myapp
cp $TOP/src/config/deploy.rb $TOP/tmp/myapp/config/deploy.rb

# ---------------- http://guides.rubyonrails.org/getting_started.html

cd  $TOP/tmp/myapp
rails generate controller home index

rm public/index.html

cat << EOF > config/routes.rb
Myapp::Application.routes.draw do
  get "home/index"
  root :to => "home#index"
end
EOF

# ---------------- https://github.com/indirect/jquery-rails

rails generate jquery:install --ui --force

# ---------------- http://www.jplayer.org/

cp $TOP/src/app/views/home/index.html.erb $TOP/tmp/myapp/app/views/home/index.html.erb
cp $TOP/src/public/javascripts/* $TOP/tmp/myapp/public/javascripts
cp $TOP/src/public/stylesheets/* $TOP/tmp/myapp/public/stylesheets
vim -s $TOP/src/scripts/add_jplayer.vim $TOP/tmp/myapp/app/views/layouts/application.html.erb > /dev/null 2>&1

