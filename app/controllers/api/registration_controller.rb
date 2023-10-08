class Api::RegistrationController < ApplicationController
    skip_before_action :authenticate_author!
    def create
        puts "Params received: #{params.inspect}"
        @author = Author.new(author_params)

        if @author.save!
            token = JsonWebToken.encode("sub": @author.id)
            render json: { token: token }, status: :created
        else
            render json: { errors: @author.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    private


    def author_params
        params.require(:author).permit(:username, :name, :lastname, :email, :password)
    end
      

end
