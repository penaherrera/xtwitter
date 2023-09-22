class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  #validations
  validates_uniqueness_of :author_id, scope: :tweet_id

  #Methods
  #Like a tweet: Create a method that encapsulates the like logic accepting a user an a text body as parameter

  def self.create_like(author, tweet)
    like = Like.new(
      author_id: author.id,
      tweet_id: tweet.id,
    )

    if like.save
      return "Like created successfully."
    else
      return "Like creation failed."
    end
  end
end
