class Tweet < ApplicationRecord
  belongs_to :author
  has_many :replies
  has_many :quotes
  has_many :retweets
  #validations
  validates :body, length:{ maximum: 255 }, presence: true



  #scopes
  scope :tweets_from_author, ->(author_id) { where(author_id: author_id) }
  #method
  def self.create_new_tweet(body, author)
    new_tweet = Tweet.new( # Assuming you meant "Tweet" instead of "Retweet"
      body: body,
      author_id: author.id,
    )
  
    if new_tweet.save # Changed "retweet" to "new_tweet"
      return "A tweet was created successfully."
    else
      return "Tweet creation failed."
    end
  end
  

end
