workers Integer(ENV['PUMA_WORKERS'] || 2)
threads Integer(ENV['PUMA_THREADS'] || 5), Integer(ENV['PUMA_THREADS'] || 5)

app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

bind "tcp://0.0.0.0:3000"

stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"


activate_control_app

environment ENV['RACK_ENV'] || 'development'
