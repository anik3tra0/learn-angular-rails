# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'visitor'
set :repo_url, 'git@github.com:anik3tra0/learn-angular-rails.git'

set :user,            'deploy'

## Linked Files & Directories (Default None):
set :linked_files, %w(config/database.yml config/secrets.yml )
set :linked_dirs,  %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets public/uploads)
set :bundle_binstubs, nil

namespace :puma do
   desc 'Create Directories for Puma Pids and Socket'
   task :make_dirs do
      on roles(:app) do
         execute "mkdir #{shared_path}/tmp/sockets -p"
         execute "mkdir #{shared_path}/tmp/pids -p"
      end
   end

   before :start, :make_dirs
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma
