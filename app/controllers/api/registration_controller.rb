class Api::RegistrationController < ApplicationController
     def create
        @author = Author.new(author_params)
    
        if @author.save
            token = JsonWebToken.encode(author_id: @author.id)
            render json: { token: token }, status: :created
        else
            render json: { errors: @author.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    private
    
    def author_params
        params.require(:author).permit(:email, :password, :username) # Adjust for your Author model
    end

end
