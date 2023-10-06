class Api::SessionController < Api::BaseController
  skip_before_action :authenticate_author!
  before_action :set_default_format

  
  def create
    author  = Author.find_by(email: author_params[:email])
    
      if author.valid_password?(author_params[:password])
        token = JsonWebToken.encode(sub: author.id)
        render json: { token: token }
      else
        render json: { errors: ["Invalid email or password"] }, status: :unauthorized
      end
  end

  def destroy
    session[:author_id] = nil
    redirect_to new_author_session_path, notice: 'Cerraste sesión con éxito'
  end

  private

  def set_default_format
    request.format = :json unless params[:format]
  end

  def author_params
    params.require(:author).permit(:email, :password)
  end
end
