class SessionController < Devise::SessionsController

    def destroy
        super 
        sign_out(current_author) 
    end

end