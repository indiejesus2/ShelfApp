require './config/environment'
# require './app/models'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "ysunrcertsfueeresesercserotettoncrecvaentseerh"
  end

  get "/" do
    erb :welcome
  end

  get '/signup' do
    erh :signup
  end

  get '/account' do
    @user = User.find(session[:user_id])
    erb :account
  end

  get '/login' do
    erb :login
  end

  post "/login" do
    user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/user'
    end
  end

  get "/logout" do
    session.clear
    redirect "/login"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end
    def current_user
      User.find(session[:user_id])
    end
  end

end
