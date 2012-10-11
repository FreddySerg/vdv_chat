require 'resque/server'
uri = URI.parse("redis://localhost:6380/")  
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }