class UsersController < ApplicationController

    get '/signup' do
        erb :'user/signup'
    end
    
    post '/signup' do
        binding.pry
        user = User.create(params)
        if user.valid?
            session[:user_id] = user.id
            redirect '/books'
        else
            flash[:alert] = "Username/Email is currently in use. Please try again."
            redirect '/signup'
        end
    end
    
    
    get '/login' do
        erb :'user/login'
    end
    
    post "/login" do
        user = User.find_by(:username => params[:username])
    
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/books'
        end
    
    end
    
    get "/logout" do
        session.clear
        redirect "/login"
    end
    
    get '/failure' do
        erb :'user/failure'
    end

end