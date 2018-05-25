web: bundle exec rails server
fetcher: bundle exec rake environment bf:fetcher:run
status-fetcher: bundle exec rake environment bf:status_fetcher:run
disparity-fetcher: bundle exec rake environment bf:disparity_fetcher:run
resque: bundle exec rake resque:workers TERM_CHILD=true COUNT=10 QUEUE=normal
