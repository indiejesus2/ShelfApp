require './config/environment'
# require './app/models'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "ysunrcertsfueeresesercserotettoncrecvaentseerh"
    register Sinatra::Flash
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end
    def current_user
      User.find(session[:user_id])
    end
    def error?
      if !logged_in?
        erb :'user/failure'
      end
    end

  end

end
