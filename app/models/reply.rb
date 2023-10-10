class Reply < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  validates :content, length:{ maximum: 255 }, presence: true

  scope :replies_from_author, ->(author_id) { where(author_id: author_id) }

  def self.create_reply(content, author, tweet)
    new_reply = Reply.new(
      content: content,
      author_id: author.id,
      tweet_id: tweet.id,
    )

    if new_reply.save
      return new_reply
    else
      return "Reply creation failed."
    end
  end

end
