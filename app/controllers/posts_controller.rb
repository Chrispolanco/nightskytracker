class PostsController < ApplicationController

    get "/posts" do 
        if logged_in?
            @posts = Post.all 
            erb :"/posts/index"
        else 
            redirect "/"
        end
    end 

    get "/posts/new" do
        if !logged_in? 
            redirect "sessions/login" 
        else 
            erb :"/posts/new" 
        end  
    end

    post "/posts" do 
        @post = current_user.post.build(params)
        if @post.save 
            redirect to "/posts/#{@post.id}"
        else 
            redirect "/posts/new"
        end 
    end 

    get "/posts/:id" do 
        @post = Post.find_by_id(params[:id])
        if @post 
            erb :"/posts/show"
        else 
            redirect "/posts"
        end  
    end 

    get "/posts/:id/edit" do 
        if !logged_in? 
            redirect "/sessions/login" 
        else  
            @post = Post.find_by_id(params[:id]) 
            if @post.user_id == current_user.id
                erb :"/posts/edit"
            else 
                redirect "/posts"
            end 
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

        if @post.save 
            redirect to "/posts/#{@post.id}"
        else 
            redirect "/posts/new"
        end 
    end
    
    delete "/posts/:id" do 
        @post = Post.find_by_id(params[:id])
        @post.delete 
        redirect "/posts"
    end  


end 