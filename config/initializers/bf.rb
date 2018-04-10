Resque.redis.namespace = "resque:bf:rails"
Resque.logger = Logger.new('rescue.log')
Resque.logger.level = Logger::INFO
BF::logger = Logger.new('log/bf.log')
