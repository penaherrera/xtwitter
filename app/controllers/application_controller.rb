class ApplicationController < ActionController::Base
skip_before_action :verify_authenticity_token
attr_reader :current_author
before_action :authenticate_token!

private

    def authenticate_token!
        payload = JsonWebToken.decode(auth_token)
        @current_author = User.find(payload["sub"])
    rescue JWT::ExpiderSignature
        render json: {errors: ["Auth token has expired"]}, status: :unauthorized
    rescue JWT::DecodeError
        render json: {errors: ["Invalid auth token"]}, status: :unauthorized
    end

    def auth_token
        @auth_token ||= request.headers.fetch("Authorization", "").split(" ").last
    end


end
