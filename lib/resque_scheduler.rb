require 'yaml'
require './config/initializers/resque'
Resque.schedule = YAML.load_file('./config/resque_scheduler.yml')
Resque::Scheduler.configure do |c|
  c.logfile = './log/scheduler.log'
  c.logformat = 'text'
end
