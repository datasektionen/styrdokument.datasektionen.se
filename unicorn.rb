worker_processes 1
working_directory "/var/rails/styrdokument/production/current"
stderr_path "/var/log/rails/styrdokument/production/unicorn.stderr.log"
stdout_path "/var/log/rails/styrdokument/production/unicorn.stdout.log"
preload_app true
timeout 30
pid "/var/rails/styrdokument/production/current/unicorn.pid"
GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true
listen "/tmp/styrdokument_production.socket", :backlog => 64

