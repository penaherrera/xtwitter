class Api::LikesController < ApplicationController

    def create
        author = Author.find(params[:author_id])
        tweet = Tweet.find(params[:tweet_id])
  
        like = Like.create_like(author, tweet)
        render json: like, status: :created
    end

end
