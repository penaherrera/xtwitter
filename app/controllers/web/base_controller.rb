class Web::BaseController < ApplicationController
    before_action :set_default_format
    before_action :authenticate_author!
    layout 'web'
  
    private
  
    def set_default_format
        request.format = :html
    end
  end
  