class Web::TweetsController < Web::BaseController
    before_action :authenticate_author!, except: [:index]
   
    def index
        if author_signed_in?
          redirect_to tweets_path
        else
          # Retrieve and render 10 random tweets in HTML
          @random_tweets = Tweet.order('RANDOM()').limit(10)
          render 'web/tweets/index'
        end
    end


  end
  