require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end

  get '/' do
    redirect '/login'
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end
    def current_user
      if session[:user_id]
        User.find(session[:user_id])
      else
        error
      end
    end
    def error
        redirect '/failure'
    end
  end

end
