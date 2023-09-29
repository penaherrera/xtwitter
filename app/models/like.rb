class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  validates_uniqueness_of :author_id, scope: :tweet_id

  def self.create_like(author, tweet)
    if author && tweet
      new_like = Like.new(
        author_id: author.id,
        tweet_id: tweet.id,
      )

      if new_like.save
        return new_like.to_json
      else
        return "Like creation failed."
      end
    else
      return "Both author and tweet must be provided."
    end
  end
end
