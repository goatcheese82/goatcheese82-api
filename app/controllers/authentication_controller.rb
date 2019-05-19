class AuthenticationController < ApplicationController
    def authenticate
        auth_token =
            Authentication.new(auth_params[:email], auth_params[:password]).call
            json_response(auth_token: auth_token)
    end

    def login
        auth_object = Authentication.new(auth_params)
        if auth_object.authenticate
            render json: {
                message: "login successful!",
                token: auth_object.generate_token },
            status: :ok
        else
            render json: {
                message: "Incorrect username/password combination"},
                status: :unauthorized
        end
    end


    private

    def auth_params
        params.permit(:username, :email, :password)
    end


end
