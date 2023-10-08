class Web::TweetsController < Web::BaseController
  before_action :authenticate_author!

  def index
    @random_tweets = Tweet.order('RANDOM()').limit(10)
  end

  def show
    @tweet = Tweet.last
    #@random_tweets = Tweet.order('RANDOM()').limit(10)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    if current_author
      @tweet = current_author.tweets.build(tweet_params)
      if @tweet.save
        redirect_to web_tweets_path, notice: 'Tweet created successfully.'
      else
        render :new
      end
    else
      redirect_to new_author_session_path, alert: 'You must be signed in to create a tweet.'
    end
  end
  

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
