# frozen_string_literal: true

require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

require 'capistrano/rvm'
set :rvm_type, :user
set :rvm_ruby_version, '2.3.1'

require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/postgresql'
require 'capistrano/nginx'
require 'capistrano/puma'

install_plugin Capistrano::Puma # Default puma tasks
install_plugin Capistrano::Puma::Nginx # if you want to upload a nginx site template

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

namespace :puma do
  desc 'Configuration of puma and nginx and deletes nginx-default-site'
  task :config_puma_nginx do
    invoke 'puma:config'
    invoke 'puma:nginx_config'
    on roles fetch(:app) do
      sudo :rm, '/etc/nginx/sites-enabled/default'
    end
  end
end

desc 'Installation of everything - config puma nginx - deploy - restart nginx'
task :install_all do
  invoke 'puma:config_puma_nginx'
  invoke 'deploy'
  invoke 'nginx:restart'
end
