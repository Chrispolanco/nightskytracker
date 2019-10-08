class PostsController < ApplicationController

    get "/posts" do 
        @posts = Post.all 
        erb :"/posts/index"
    end 

    get "/posts/new" do
        erb :"/posts/new"
    end

    post "/posts" do 
        @post = Post.create(params)
        redirect to "/posts"
    end 

end 