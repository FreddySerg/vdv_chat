require 'resque/tasks'
task "resque:setup" => :environment do
  Resque.before_fork = Proc.new { 
    ActiveRecord::Base.establish_connection
  }
end

desc "kill all workers (using -QUIT), god will take care of them"
task "resque:stop_workers" => :environment do
  pids = Array.new
  Resque.workers.each do |worker|
    pids << worker.to_s.split(/:/).second
  end

  if pids.size > 0
    system("kill -QUIT #{pids.join(' ')}")
  end

  # god should handle the restart
end