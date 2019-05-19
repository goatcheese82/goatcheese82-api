class PostsController < ApplicationController
    def index
        @posts = Post.all
        render json: @posts
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        if @post.save
            render json: @post
        else
            render json: {
                message: 'Your post was not created'
            }
        end
    end
    
    def show
        @post = Post.find(params[:id])
        render json: @post
    end

    def edit
    end

    def update
    end

    def destroy
        @post = Post.find(params[:id])
        @post.delete
        render json: @post
    end

    private

    def post_params
        params.permit(
            :title,
            :content
        )
    end
end
