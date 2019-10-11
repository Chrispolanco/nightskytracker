require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password"
  end
  
  get '/' do
     erb :index
  end

  helpers do 

    def logged_in?
      !!current_user
    end  

    def login(username, password)
      user = user.find_by(:username =>username)
      if user && user.authenticate(password)
        session[:username] = user.username
      else 
        redirect "/sessions/login"
      end 
    end 

    def logout! 
      session.clear
    end 

    def current_user
      @current_user ||= User.find_by(:username => session[:username]) if session[:email]
    end 

  end 

end

