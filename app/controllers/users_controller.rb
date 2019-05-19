class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def new
        @user = User.new
    end
    def create
        @user = User.create(user_params)
        if @user.save
            @user.uid = @user.id
            @user.save
            render json: @user
        else
            render json: {
                message: "Please fill all fields with valid"
            }
        end
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    
    def user_params
        params.permit(
        :name,
        :username,
        :uid,
        :email,
        :signed_id,
        :password,
        :image
    )
    end
end
