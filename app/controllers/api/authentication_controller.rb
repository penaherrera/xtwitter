class AuthenticationController < Api::BaseController
    skio_before_action :authenticate_token!
    
    def create
        author = Author.find_by(email: params[:author][:email])
        if author.valid_password? params[:author][:password]
            render json: { token: JsonWebToken.encode(sub: author.id) }
        else 
            render json: { errors: ["Invalid email or password"] }
        end

    end


end