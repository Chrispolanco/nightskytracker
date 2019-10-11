class PostsController < ApplicationController

    get "/posts" do 
        @posts = Post.all 
        erb :"/posts/index"
    end 

    get "/posts/new" do
        if !session[:email]
            redirect "sessions/login" 
        else 
            erb :"/posts/edit" 
        end  
    end

    post "/posts" do 
        user = User.find_by_id(params[:user_id]) 
        @post = user.post.build(params)
        redirect to "/posts/#{@post.id}"
    end 

    get "/posts/:id" do 
        @post = Post.find_by_id(params[:id])
        erb :"/posts/show" 
    end 

    get "/posts/:id/edit" do 
        if !session[:email]
            redirect "sessions/login" 
        else 
            @post = Post.find_by_id(params[:id]) 
            erb :"/posts/edit"
        end 
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
        redirect "/posts/#{@post.id}"
    end
    
    delete "/posts/:id/delete" do 
        @post = Post.find_by_id(params[:id])
        @post.delete 
        redirect "/posts"
    end  


end 