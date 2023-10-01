class Retweet < ApplicationRecord
  belongs_to :tweet
  belongs_to :author


  scope :retweets_from_author, ->(author_id) { where(author_id: author_id) }

  def self.create_retweet(author, tweet)
    if author && tweet
    retweet = Retweet.new(
      author_id: author.id,
      tweet_id: tweet.id,
    )

      if retweet.save
        return "Retweet created successfully."
      else
        return "Retweet creation failed."
      end
    else
      return "Both author and tweet must be provided."
    end
  end
end
