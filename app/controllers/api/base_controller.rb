class Api::BaseController < ApplicationController
    #So we can access to the current user with all the controllers
    attr_reader :current_user
    before_action :authenticate_user!

    private


end