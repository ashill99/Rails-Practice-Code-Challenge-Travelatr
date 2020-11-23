class PostsController < ApplicationController

    def show 
        @post = Post.find(params[:id])
    end 

    def new
        @post = Post.new
        @destinations = Destination.all
        @bloggers = Blogger.all
    end 

    def create
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to post_path(@post)
        else 
            flash[:errors]= @post.errors.full_messages 
            redirect_to new_post_path
        end
    end 

    def edit
        @post = Post.find(params[:id])
    end 

    def update
        @post = Post.find(params[:id])
        if @post.valid?
            @post.update(post_params)
            redirect_to post_path(@post)
        else 
            flash[:errors]= @post.errors.full_messages 
            redirect_to edit_post_path
        end 
    end

    def add_like 
        @post = Post.find(params[:id])
        likes = @post.likes.to_i + 1
        @post.update(likes: likes)
        redirect_to post_path(@post)
    end

    private
    def post_params 
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end 
end 