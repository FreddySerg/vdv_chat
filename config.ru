# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run NewApp::Application

require 'resque/server'  
run Rack::URLMap.new "/" => NewApp::Application,  "/vdv_resque" => Resque::Server.new