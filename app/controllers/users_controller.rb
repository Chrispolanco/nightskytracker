class UsersController < ApplicationController
        
    get "/users/signup" do 
        erb :"users/new"
    end 

    post "/users/signup" do 
        user = User.new(:username => params[:username], :password =>params[:password]) 
        if user.save 
            redirect "users/login"
        else 
            redirect "users/failure"
        end
    end 

    get "/users/login" do 
        erb :"users/login" 
    end 

    post "/users/login" do 
        user = User.find_by(:username => params[:username]) 
        if user && user.authenticate(params[:password]) 
            sesstion[:user_id] = user.id
            redirect "users/success" 
        else 
            redirect "users/failure"
        end 
    end 

    get "/users/success" do 
        if logged_in
            erb :"users/success"
        else 
            redirect "users/login"
        end 
    end 

    get "/users/failure" do 
        erb :"users/failure" 
    end 

    get "/users/logout" do 
        session.clear
        redirect "/"
    end 

end 
        