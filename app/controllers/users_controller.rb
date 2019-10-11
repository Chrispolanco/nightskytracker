class UsersController < ApplicationController
    
    get "/users/signup" do 
        erb :"users/new"
    end 

    post "/users" do 
        user = User.new(:name => params[:name], :username => params[:username], :password =>params[:password]) 
        if user.save 
            redirect "/users/login"
        else 
            erb :"/users/new"
        end
    end 


end 
        