class Quote < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  validates :content, length: { maximum: 255 }, presence: true

  scope :quotes_from_author, ->(author_id) { where(author_id: author_id) }

  def self.create_quote(content, author, tweet)
    new_quote = Quote.new(
      content: content,
      author_id: author.id,
      tweet_id: tweet.id,
    )

    if new_quote.save
      return new_quote
    else
      return "Quote creation failed."
    end
  end
end
