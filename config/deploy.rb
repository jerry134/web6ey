require "bundler/capistrano"

set :application, "web6ey"
#set :scm, :git
#set :repository,  "git://github.com/jerry134/web6ey.git"
#set :scm, :none
set :repository,  '.'
set :deploy_via, :copy

set :default_env,     'production'
set :rails_env,       ENV['rails_env'] || ENV['RAILS_ENV'] || default_env
set :deploy_to,       "/var/www/#{application}_#{rails_env}"
set :keep_releases,   3
#set :deploy_via,      :remote_cache
#set :normalize_asset_timestamps, false
set :user,            "ken"
set :group,           "ken"
set :location, "192.34.61.70"
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, location                          # Your HTTP server, Apache/etc
role :app, location                          # This may be the same as your `Web` server
role :db,  location, :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"
#before "deploy", "deploy:setup"
#after "deploy:restart", "deploy:cleanup" 
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
# Add RVM's lib directory to the load path.

# Load RVM's capistrano plugin.    
require "rvm/capistrano"
set :rvm_ruby_string, '1.9.3'

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
