class Api::AuthorsController < Api::BaseController
    def show
      @author = Author.find(params[:id])
      render 'api/authors/show', status: :ok
    end
  end
  