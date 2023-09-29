class RepliesController < ApplicationController

    def create
        author = Author.find(params[:author_id])
        tweet = Tweet.find(params[:tweet_id])
        reply_content = params[:content]
        reply = Reply.create_reply(reply_content, author, tweet)
        render json: reply, status: :created
    end
    
end
