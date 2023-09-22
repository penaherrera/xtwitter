class Quote < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  # Validations
  validates :content, length: { maximum: 255 }, presence: true

  #Scopes
  scope :quotes_from_author, ->(author_id) { where(author_id: author_id) }

  #Method
  #QuoteTweet: Create a method that encapsulates the retweet logic accepting a user an a text body as parameter
  def self.create_quote(content, author, tweet)
    quote = Quote.new(
      content: content,
      author_id: author.id,
      tweet_id: tweet.id,
    )

    if quote.save
      return "Quote created successfully."
    else
      return "Quote creation failed."
    end
  end
end
