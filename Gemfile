source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.6'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'
gem 'resque'
gem 'coffee-script'
gem 'resque-scheduler'
gem 'bf', github: 'jiikko/bf', branch: :master
gem 'foreman'
gem 'slim-rails'
gem 'jquery-rails'
gem 'kaminari'
gem 'newrelic_rpm'

group :development, :test do
  gem 'rspec-rails'
  gem 'pry'
end

group :test do
  gem 'resque_spec'
end
