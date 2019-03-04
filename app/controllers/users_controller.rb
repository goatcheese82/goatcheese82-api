class UsersController < ApplicationController
    def login
        auth_object = Authentication.new(login_params)
        if auth_object.authenticate
            render json: {
                message: "login successful!",
                token: auth_object.generate_token },
            status: :ok
        else
            render json: {
                message: "incorrect username/password combination"},
                status: :unauthorized
        end
    end


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

    def login_params
        params.permit(:username, :password)
    end

    def user_params
        params.permit(
        :name,
        :username,
        :uid,
        :email,
        :signed_id,
        :password
    )
    end
end
