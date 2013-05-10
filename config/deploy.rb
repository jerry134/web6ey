#encoding:utf-8
require 'bundler/capistrano'

set :application, "web6ey"
#部署代码时从github上取代码
#set :repository, "git://github.com/jerry134/web6ey.git"
#部署代码时从本地取代码,更快些
set :repository, File.expand_path('../../.git/', __FILE__)
#set :branch, "master"

set :scm, :git

set :user, ENV['USER'] || "ruby"
set :use_sudo, false

# 部署路径修改为当前用户的目录，如果用默认的根目录且没有root权限会引起Permission denied的错误
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache # 不要每次都获取全新的repository
set :deploy_server, 'localhost'

set :bundle_without,  [:development, :test]

# for rbenv
set :rbenv_version, ENV['RBENV_VERSION'] || "1.9.3-p392"
set :default_environment, {
  'PATH' => "/home/#{user}/.rbenv/shims:/home/#{user}/.rbenv/bin:$PATH",
  'RBENV_VERSION' => "#{rbenv_version}",
}

role :web, "#{deploy_server}"                          # Your HTTP server, Apache/etc
role :app, "#{deploy_server}"                          # This may be the same as your `Web` server
role :db,  "#{deploy_server}", :primary => true        # This is where Rails migrations will run
#role :db,  "your slave db-server here"

namespace :deploy do
  desc "Start Application"
  task :start, :roles => :app do
    run "cd #{current_path}; RAILS_ENV=production bundle exec unicorn_rails -c config/unicorn.rb -D"
  end

  desc "Stop Application"
  task :stop, :roles => :app do
    run "kill -QUIT `cat #{shared_path}/pids/unicorn.#{application}.pid`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "kill -USR2 `cat #{shared_path}/pids/unicorn.#{application}.pid`"
  end

  desc "Populates the Production Database"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed"
  end

  task :setup_config, roles: :app do
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.yml.example"), "#{shared_path}/config/database.yml"
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml  #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update","deploy:symlink_config"
end
