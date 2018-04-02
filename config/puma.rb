threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count
port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }
plugin :tmp_restart

# daemonize true
app_root = File.expand_path('../../', __FILE__)
pidfile File.expand_path('tmp/pids/puma.pid', app_root)
state_path File.expand_path('tmp/pids/puma.state', app_root)
# stdout_redirect File.expand_path('log/puma_stdout.log', app_root),
#                 File.expand_path('log/puma_stderr.log', app_root), true
                bind "unix://#{app_root}/tmp/sockets/puma.sock"
