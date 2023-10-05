class ApplicationController < ActionController::Base
skip_before_action :verify_authenticity_token
attr_reader :current_author
before_action :authenticate_author!
respond_to :json

private

    

end
