class Web::AuthorsController < Web::BaseController
    def show
        @author = Author.find(current_author.id)
    end
  end
  