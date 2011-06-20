# server side config
# https://rvm.beginrescueend.com/integration/capistrano/
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                               # must be installed on server
set :rvm_ruby_string, '1.8.7@norails'                  # must be installed on server

set :application, "norails"

set :repository,  "."
set :scm, :git
# set :branch, "master"
# set :git_shallow_clone, 1

set :deploy_to, "/u/#{application}"
set :deploy_via, :copy
set :copy_exclude, [".git", ".DS_Store"]
set :keep_releases, 2

set :location, "ec2-184-73-20-225.compute-1.amazonaws.com"
role :app, location
role :web, location
role :db,  location, :primary => true

# use run instead of sudo by default
set :use_sudo, false

set :user, "ec2-user"
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "server001keypair.pem")]
