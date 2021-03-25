require 'dotenv/load'

ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
  set :database, "sqlite3:///database.db"
end

configure :production do 
  db = URI.parse(ENV['https://infinite-brook-32239.herokuapp.com/'] || 'postgres://localhost/mydb1')

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db:scheme,
    :host => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

require './app/controllers/application_controller'
require_all 'app'
