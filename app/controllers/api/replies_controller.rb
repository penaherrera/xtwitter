class Api::RepliesController < Api::BaseController

    def create
        @author = Author.find(params[:author_id])
        @tweet = Tweet.find(params[:tweet_id])
        @reply_content = params[:content]
        @reply = Reply.create_reply(@reply_content, @author, @tweet)
        render 'api/replies/create', status: :created
    end
    
end
