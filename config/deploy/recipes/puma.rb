set :puma_role, -> { :app }
set :puma_conf, -> { "#{release_path}/config/puma/#{fetch(:rails_env)}.rb" }
set :puma_state, -> { File.join(shared_path, 'tmp', 'pids', 'puma.state') }
set :puma_pid, -> { File.join(shared_path, 'tmp', 'pids', 'server.pid') }

namespace :puma do
  # desc 'Setup Puma config file'
  # task :config do
  #   on roles(fetch(:puma_role)) do |role|
  #     # git_plugin.upload_puma_rb(role)
  #   end
  # end

  desc 'Start puma'
  task :start do
    on roles(fetch(:puma_role)) do |role|
      info "using conf file #{fetch(:puma_conf)}"

      if test "[ -f #{fetch(:puma_pid)} ]"
        info 'Already Puma is running'
      else
        within current_path do
          execute :bundle, "exec puma -C #{fetch(:puma_conf)} --environment #{fetch(:rails_env)} --daemon"
        end
      end
    end
  end


  task :stop do
    on roles (fetch(:puma_role)) do |role|
      within current_path do
        if test "[ -f #{fetch(:puma_pid)} ]"
          execute :bundle, "exec pumactl -F #{fetch(:puma_conf)} stop"
          execute :rm, fetch(:puma_pid)
        else
          # delete invalid pid file , process is not running.
          warn 'Puma not running'
        end
      end
    end
  end


  desc "restart puma"
  task :restart do
    on roles (fetch(:puma_role)) do |role|
      within current_path do
        if test "[ -f #{fetch(:puma_pid)} ]"
          execute :bundle, "exec pumactl -F #{fetch(:puma_conf)} restart"
        else
          # Puma is not running or state file is not present : Run it
          invoke 'puma:start'
        end
      end
    end
  end

  desc "hard_restart puma"
  task :hard_restart do
    on roles (fetch(:puma_role)) do |role|
      within current_path do
        invoke('puma:stop')
        invoke('puma:start')
      end
    end
  end

  # task :check do
  #   on roles(fetch(:puma_role)) do |role|
  #     #Create puma.rb for new deployments
  #     unless  test "[ -f #{fetch(:puma_conf)} ]"
  #       warn 'puma.rb NOT FOUND!'
  #       # git_plugin.upload_puma_rb(role)
  #       info 'puma.rb generated'
  #     end
  #   end
  # end

end

 after 'deploy:finished', 'puma:hard_restart' 