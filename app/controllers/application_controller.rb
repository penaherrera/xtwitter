class ApplicationController < ActionController::Base
skip_before_action :verify_authenticity_token
attr_reader :current_author
before_action :authenticate_author!
#respond_to :json
#before_action :configure_permitted_parameters, if :devise_controller?
before_action :configure_permitted_parameters, if: :devise_controller?   
protected


private


    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :lastname])
    end
end

