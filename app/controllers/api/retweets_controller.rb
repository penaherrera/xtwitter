class Api::RetweetsController < Api::BaseController
    before_action :authenticate_author!
    def create
        @author = Author.find(params[:author_id])
        @tweet = Tweet.find(params[:tweet_id])
        @retweet = Retweet.create_retweet(@author, @tweet)
        #render json: retweet, status: :created
        render 'api/retweets/create', status: :created

    end

end
