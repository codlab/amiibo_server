# config valid only for current version of Capistrano
#lock '3.4.0'

#require 'bundler/capistrano'
#require "capistrano/version"
#require 'capistrano/rvm'

if defined?(Capistrano::Version) && Gem::Version.new(Capistrano::Version).release >= Gem::Version.new("3.0")
  raise "For Capistrano 3.x integration, please use http://github.com/capistrano/bundler"
end

set :rvm_type, :system
set :rvm_ruby_version, '1.9.3-p551'

set :application, "Amiibo"
set :repo_url,  "git@github.com:codlab/amiibo_server.git"

set :deploy_to, "/data/amiibo"

set :scm, :git
set :branch, "master"

set :use_sudo, true
set :rails_env, "production"

set :deploy_via, :remote_cache
set :copy_exclude, [ '.git' ]

server "amiibo.codlab.eu", user: "deploy", :roles => [:app, :web, :db], :primary => true

#set :default_env, {
#      'PATH' => "/var/lib/gems/1.8/bin:$PATH"
#}

#namespace :deploy do
#  task :restart do
#    on roles(:app), in: :groups, limit: 3, wait: 10 do
#      run "sudo touch #{File.join(current_path,'tmp','restart.txt')}"
#    end
#  end
#end

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
