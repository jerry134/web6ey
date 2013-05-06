#source 'https://rubygems.org'
source 'http://ruby.taobao.org'

gem 'rails', '3.2.13'

gem 'thin'
gem 'mysql2'
gem 'pg', group: :production
gem 'fog', "~> 1.3.1"

gem 'execjs'
gem 'devise'
gem "cancan"
gem 'simple_form'
gem 'will_paginate', '> 3.0'
gem 'twitter-bootstrap-rails'
gem 'bootstrap-will_paginate'
gem 'acts-as-taggable-on'
gem 'carrierwave'
gem 'capybara'
# for enumerate
gem "enumerate_it", "~> 1.0.3"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'jquery-rails'
  gem 'chosen-rails'
  # Recommended to install Node.js, without therubyracer
  gem 'therubyracer', :platforms => :ruby
  gem 'less-rails'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'pry-remote'
  gem 'pry-stack_explorer'
  gem 'pry-debugger'
  gem 'pry-nav'
  gem 'quiet_assets'
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
end

group :development, :test do
  gem 'pry'
  gem 'forgery'
  gem 'rspec-rails', "~> 2.0"
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

group :test do
  gem 'simplecov', :require => false
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
