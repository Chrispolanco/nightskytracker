class SessionsController < ApplicationController

    get "/sessions/login" do 
        erb :"/sessions/login" 
    end 

    post "/sessions" do 
        session[:username] = params[:username]
        redirect "/posts"
    end 

    get "logout" do 
        session.clear
    end 


end 

