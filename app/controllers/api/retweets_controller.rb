class Api::RetweetsController < ApplicationController

    def create
        author = Author.find(params[:author_id])
        tweet = Tweet.find(params[:tweet_id])
        retweet = Retweet.create_retweet(author, tweet)
        render json: retweet, status: :created
    end

end
