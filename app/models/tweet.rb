class Tweet < ApplicationRecord
  belongs_to :author
  has_many :replies
  has_many :quotes
  has_many :likes
  has_many :retweets
  has_many :taggings
  has_many :hashtags, through: :taggings
  validates :body, length:{ maximum: 255 }, presence: true

  scope :tweets_from_author, ->(author_id) { where(author_id: author_id) }

  def self.create_new_tweet(body, author)
    new_tweet = Tweet.new( 
      body: body,
      author_id: author.id,
    )
  
    if new_tweet.save 
      return new_tweet.to_json
    else
      return "Tweet creation failed."
    end
  end
  

end
