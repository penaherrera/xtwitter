class Api::BaseController < ApplicationController
    before_action :set_default_format
    before_action :authenticate_author!
    private

    def set_default_format
        request.format = :json
    end
end