class UsersController < ApplicationController
    
    get "/users/signup" do 
        erb :"users/new"
    end 

    post "/users" do 
        user = User.new(:name => params[:name], :username => params[:username], :password =>params[:password]) 
        if user.save 
            session[:username] = user.username
                redirect "/posts"
        else 
            erb :"/users/new"
        end
    end 


end 
        