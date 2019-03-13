# frozen_string_literal: true

# Bind on a specific TCP address.
# We won't bother using unix sockets because Nginx will be running in a different container.
bind "tcp://#{ENV['BIND_ON']}:#{ENV['BIND_ON_PORT']}"

# Puma supports threading. Requests are served through an internal thread pool.
# Even on MRI, it is beneficial to leverage multiple threads because I/O operations do not lock the GIL.
# This typically requires more CPU resources. More threads will increase CPU load but will also increase throughput.
# Like anything this will heavily depend on the size of the application's demands.
# RAILS_MAX_THREADS will match the default thread size for Active Record.
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count

# Puma supports spawning multiple workers. It will fork out a process at the
# OS level to support concurrent requests. This typically requires more RAM.
# Tweak this number to improve performance using as many workers as possible without starving the server of RAM.
# If using threads and workers together, the concurrency of the app will be THREADS * WORKERS.
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Time to workers to check in into the master process without them being rebooted.
worker_timeout ENV.fetch("WORKER_TIMEOUT") { 30 }.to_i

# The path to the puma binary without any arguments.
restart_command "puma"

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code before forking the application.
# This takes advantage of Copy On Write process behavior so workers use less memory.
preload_app!

# Since you'll likely use > 1 worker in production, we'll need to configure
# Puma to do a few things when a worker boots.
on_worker_boot do
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end
