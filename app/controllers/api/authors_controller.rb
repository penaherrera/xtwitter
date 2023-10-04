class Api::AuthorsController < Api::BaseController
  
  before_action :authenticate_user!
  def show
      @author = Author.find(params[:id])
      render 'api/authors/show', status: :ok
    end
  end
  