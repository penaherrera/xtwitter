class Retweet < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  # Scopes
  scope :retweets_from_author, ->(author_id) { where(author_id: author_id) }

  # Method
  # Retweet method: Create a method that encapsulates the retweet logic accepting a user a parameter
  def self.create_retweet(author, tweet)
    retweet = Retweet.new(
      author_id: author.id,
      tweet_id: tweet.id,
    )

    if retweet.save
      return "Retweet created successfully."
    else
      return "Retweet creation failed."
    end
  end
end
