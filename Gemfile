# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'autoprefixer-rails'
gem 'bcrypt', '~> 3.1.7'
gem 'foundation-rails'
gem 'haml', '~> 5.2', '>= 5.2.1'
gem 'jbuilder', '~> 2.7'
gem 'pagy', '~> 3.5'
gem 'pg', '~> 1.2', '>= 1.2.3'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4.1'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'turbo-rails', '~> 0.7.14'
gem 'webpacker', '~> 5.0'

gem 'bootsnap', '>= 1.4.4', require: false

gem 'sidekiq'
gem 'sinatra'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'annotate'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
