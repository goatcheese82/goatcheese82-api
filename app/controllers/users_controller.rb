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

    private

    def login_params
        params.permit(:username, :password)
    end
end
