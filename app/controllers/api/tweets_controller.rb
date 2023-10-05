class Api::TweetsController < Api::BaseController
  before_action :authenticate_author!
    def create
        author = Author.find(params[:author_id])
        tweet = Tweet.create_new_tweet(params[:body], author)
        render json: tweet, status: :created
    end
      
     def update
      #update method, update logic for the test tweet_update
     end
  
    def tweet_stats
      @tweet = Tweet.find(params[:id])
      stats = {
        likes: @tweet.likes.count,
        retweets: @tweet.retweets.count,
        replies: @tweet.replies.count,
        #bookmarks: tweet.bookmarks.count,
        quoted: @tweet.quotes.count
      }
      #render 'api/tweets/stats', status: :ok
      render json: stats
    end
  
    def author_tweets
      author = Author.find(params[:id])
      stats = {
        tweets: author.tweets.count,
        likes: author.likes.count,
        retweets: author.retweets.count,
        replies: author.replies.count,
        bookmarks: author.bookmarks.count
      }
      render json: stats
    end
  
    def author_tweets_and_replies
      author = Author.find(params[:id])
      tweets = author.tweets.includes(:replies).all + author.replies.all
      render json: tweets, each_serializer: TweetSerializer
    end
  
    private
  
    def tweet_params
      params.require(:tweet).permit(:body)
    end
  end
  