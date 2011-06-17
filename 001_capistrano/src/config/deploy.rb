set :application, "myapp"

set :repository,  "."
set :scm, :git

set :deploy_to, "/var/www"
set :deploy_via, :copy

set :location, "ec2-204-236-222-167.compute-1.amazonaws.com"
role :app, location
role :web, location
role :db,  location, :primary => true

set :use_sudo, false
set :user, "ec2-user"
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "server001keypair.pem")]

#set :default_environment, {
#  'PATH' => "/path/to/.rvm/gems/ree/1.8.7/bin:/path/to/.rvm/bin:/path/to/.rvm/ree-1.8.7-2009.10/bin:$PATH",
#  'RUBY_VERSION' => 'ruby 1.8.7',
#  'GEM_HOME'     => '/path/to/.rvm/gems/ree-1.8.7-2010.01',
#  'GEM_PATH'     => '/path/to/.rvm/gems/ree-1.8.7-2010.01',
#  'BUNDLE_PATH'  => '/path/to/.rvm/gems/ree-1.8.7-2010.01'
#}

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end