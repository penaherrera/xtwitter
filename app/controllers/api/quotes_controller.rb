class Api::QuotesController < ApplicationController

    def create
        @author = Author.find(params[:author_id])
        @tweet = Tweet.find(params[:tweet_id])
        @quote_content = params[:content]
        @quote = Quote.create_quote(@quote_content, @author, @tweet)
        
        render 'api/quotes/create', status: :created
    end

end
