class PostsController < ApplicationController

    get "/posts" do 
        @posts = Post.all 
        erb :"/posts/index"
    end 

    get "/posts/new" do
        erb :"/posts/new"
    end

end 