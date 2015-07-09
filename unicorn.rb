worker_processes 1
preload_app true
timeout 30
GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

