class Api::BaseController < ApplicationController
    #So we can access to the current user with all the controllers
    attr_reader :current_user
    before_action :authenticate_token!

    private


    def authenticate_token!
        payload = JsonWebToken.decode(auth_token)
 
        @current_user = User.find(payload["sub"])
    rescue JWT::ExpiredSignature
        render json: {errors: ["Auth Token has expired"]}, status: :unauthorized

    rescue JWT::DecodeError
        render json: {errors: ["Invalid auth token"]}, status: :unauthorized


    end

    def auth_token
        @auth_token ||= request.headers.fetch("Authorization", "").split(" ").last
    end

end