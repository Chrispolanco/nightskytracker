class UsersController < ApplicationController
    
    get "/users/signup" do 
        erb :"users/new"
    end 

    post "/users" do 
        @user = User.new(params) 
        if @user.save 
            session["user_id"] = @user.id
                login(params[:username], params[:password])
                redirect "/posts"
        else 
            erb :"/users/new"
        end
    end 


end 
        