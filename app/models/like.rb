class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  validates_uniqueness_of :author_id, scope: :tweet_id

  def self.create_like(author, tweet)
    if author && tweet
      like = Like.new(
        author_id: author.id,
        tweet_id: tweet.id,
      )

      if like.save
        return "Like created successfully."
      else
        return "Like creation failed."
      end
    else
      return "Both author and tweet must be provided."
    end
  end
end
