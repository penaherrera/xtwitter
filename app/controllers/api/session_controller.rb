class Api::SessionController < ApplicationController
  before_action :authenticate_token!
  def create
    author = Author.find_by(email: params[:author][:email])

      if author&.valid_password?(params[:author][:password])
        token = JsonWebToken.encode(sub: author.id)
        render json: { token: token }, status: :created
      else
        render json: { errors: ["Invalid email or password"] }, status: :unauthorized
      end
  end

  def destroy
    
  end
end
