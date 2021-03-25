source 'http://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repon_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'sinatra-flash'
gem 'rake'
gem 'require_all'

gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'tux'
gem 'dotenv'

group :development, :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
  gem 'sqlite3', '~> 1.3.6'
end

group :production do
  gem 'pg'
  gem 'activerecord-postgresql-adapter'
end
