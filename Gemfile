# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'
gem 'rails', '6.1.3'
gem 'pg', '~> 1.2'
gem 'puma', '~> 5.2'
gem 'webpacker', '~> 5.2'
gem 'turbolinks', '~> 5.2'
gem 'devise', '~> 4.7', '>= 4.7.3'
gem 'bootsnap', '~> 1.7', require: false
gem 'newrelic_rpm', '~> 6.15'
gem 'wicked', '~> 1.3', '>= 1.3.4'
gem 'will_paginate', '~> 3.3'
gem 'metainspector'
gem 'filterrific', '~> 5.2', '>= 5.2.1'
gem 'devise-bootstrap-views', '~> 1.0'


group :development, :test do
  gem 'byebug', '~> 11.1', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.16'
  gem 'pry', '~> 0.13.1'
  gem 'pry-byebug', '~> 3.9'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 4.0'
  gem 'rubocop', '~> 1.10', require: false
  gem 'rubocop-performance', '~> 1.9', require: false
  gem 'rubocop-rails', '~> 2.9', require: false
  gem 'rubocop-rspec', '~> 2.2', require: false
  gem 'slim_lint', '~> 0.20.2', require: false
end

group :development do
  gem 'listen', '~> 3.4'
  gem 'spring', '~> 2.1'
  gem 'spring-commands-rspec', '~> 1.0'
  gem 'spring-watcher-listen', '~> 2.0'
  gem 'web-console', '~> 4.1'
end

group :test do
  gem 'capybara', '~> 3.35'
  gem 'coveralls_reborn', '~> 0.20.0', require: false
  gem 'email_spec', '~> 2.2'
  gem 'selenium-webdriver', '~> 3.142'
  gem 'simplecov', '~> 0.21.2', require: false
  gem 'webmock', '~> 3.11', require: false
end

group :staging, :production do
  gem 'rack-timeout', '~> 0.6.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '~> 1.2019', platforms: %i[mingw mswin x64_mingw jruby]
