class Api::BookmarksController < Api::BaseController
    def create
      @author = Author.find(params[:author_id])
      @tweet = Tweet.find(params[:tweet_id])
  
      @bookmark = Bookmark.create_bookmark(@author, @tweet)
  
      render 'api/bookmarks/create', status: :created
    end
  end
  