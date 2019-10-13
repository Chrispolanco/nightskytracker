class SessionsController < ApplicationController

    get "/sessions/login" do 
        erb :"/sessions/login" 
    end 

    post "/sessions" do 
        login(params[:username], params[:password])
        redirect "/posts"
    end 

    get "/sessions/logout" do 
        logout! 
        redirect "/sessions/login" 
    end 


end 

