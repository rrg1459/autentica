# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum, this matches the default thread size of Active Record.
#
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests, default is 3000.
#
port        ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
#
#environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked webserver processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory. If you use this option
# you need to make sure to reconnect any threads in the `on_worker_boot`
# block.
#
# preload_app!

# The code in the `on_worker_boot` will be called if you are using
# clustered mode by specifying a number of `workers`. After each worker
# process is booted this block will be run, if you are using `preload_app!`
# option you will want to use this block to reconnect to any threads
# or connections that may have been created at application boot, Ruby
# cannot share connections between processes.
#
# on_worker_boot do
#   ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
# end

# Allow puma to be restarted by `rails restart` command.

#
# Desde aqui son nuevas las lineas y hay que comentar para correo en modo desarrollo ( $ rails s )
# cuando se descomentan hay que reininicar el equipo para que el cable se puede ejecutar correctamente
#

# if !ENV['RAILS_ENV'] || ENV['RAILS_ENV'] == "production"
# 	plugin :tmp_restart
# 	# Change to match your CPU core count
# 	workers 4
# #	workers 2 # PC VIT

# 	# Min and Max threads per worker
# 	threads 1, 6

# 	app_dir = File.expand_path("../..", __FILE__)
# 	shared_dir = "#{app_dir}/shared"

# 	# Default to production
# 	rails_env = ENV['RAILS_ENV'] || "production"
# 	environment rails_env

# 	# Set up socket location
# 	bind "unix://#{shared_dir}/sockets/puma.sock"

# 	# Logging
# 	stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# 	# Set master PID and state locations
# 	pidfile "#{shared_dir}/pids/puma.pid"
# 	state_path "#{shared_dir}/pids/puma.state"
# 	activate_control_app

# 	on_worker_boot do
# 		require "active_record"
# 		ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
# 		ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml")[rails_env])
# 	end
# end