# config valid for current version and patch releases of Capistrano
lock '~> 3.11.0'

set :application, 'novel_spider'
set :repo_url, 'git@github.com:wesson-yi/novel_spider.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/srv/www/novel_spider'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/settings.yml', 'config/master.key'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
set :default_env, path: '/opt/ruby/bin:$PATH'

# Default value for local_user is ENV['USER']
set :local_user, -> { `git config user.name`.chomp }

set :rvm_ruby_version, 'ruby-2.6.0'

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :puma_bind, 'tcp://0.0.0.0:3100'

set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }

namespace :deploy do
  task :copy_config do
    on roles(:all) do |_host|
      %w[database.yml settings.yml credentials.yml.enc master.key].each do |f|
        upload! 'config/' + f, '/srv/www/novel_spider/shared/config/' + f
      end

      %w[puma.rb].each do |f|
        upload! 'config/' + f, '/srv/www/novel_spider/shared/' + f
      end
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end
