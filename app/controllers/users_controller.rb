class UsersController < ApplicationController

    get '/users' do 
        @users = User.all
        erb :'/users/index' 
    end 

    get '/users/new' do 
        @users = User.all 
        erb: '/users/new'
    end 
end 