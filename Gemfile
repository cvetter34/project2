source 'https://rubygems.org'

gem 'rails', '4.0.3'
gem 'activesupport', require: 'active_support'
gem 'uglifier'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'sqlite3'
gem 'slim'
gem 'bson_ext'
gem 'mongoid', github: 'mongoid/mongoid'
gem 'bcrypt'
gem 'sprockets'

group :development, :test do
  # gem "better_errors"
  gem "binding_of_caller"
  gem "letter_opener"
  gem 'pry'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'rb-inotify', :require => false
  gem 'rb-fchange', :require => false
  gem 'guard-rspec'
  gem 'guard-livereload'

  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end