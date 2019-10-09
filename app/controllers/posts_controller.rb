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
        redirect to "/posts/#{@post.id}"
    end 

    get "/posts/:id" do 
        @post = Post.find_by_id(params[:id])
        erb :"/posts/show" 
    end 

    get "/posts/:id/edit" do 
        @post = Post.find_by_id(params[:id]) 
        erb :"/posts/edit" 
    end 

    patch "/posts/:id" do 
        @post = Post.find_by_id(params[:id]) 
        @post.title = params[:title]
        @post.link = params[:link]
        @post.description = params[:description]
        @post.latitude = params[:latitude]
        @post.longitude = params[:longitude]
        @post.date = params[:date] 
        @post.save 
        redirect to "recipes/#{@recipe.id}"
    end
    
    delete "/posts/:id" do 
        @post = Post.find_by_id(params[:id])
        @post.delete 
        redirect to "/posts"
    end  


end 