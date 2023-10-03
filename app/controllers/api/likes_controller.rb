class Api::LikesController < Api::BaseController

    def create
        @author = Author.find(params[:author_id])
        @tweet = Tweet.find(params[:tweet_id])
  
        @like = Like.create_like(@author, @tweet)

        render 'api/likes/create', status: :created
    end

end
