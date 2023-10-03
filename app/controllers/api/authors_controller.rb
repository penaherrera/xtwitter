class Api::AuthorsController < ApplicationController
    def show
      @author = Author.find(params[:id])
      render 'api/authors/show', status: :ok
    end
  end
  