class Bookmark < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  scope :boorkmarks_from_author, ->(author_id) { where(author_id: author_id) }

  def self.create_bookmark(author, tweet)
    if author && tweet
      bookmark = Bookmark.new(
        author_id: author.id,
        tweet_id: tweet.id,
      )

      if bookmark.save
        return "Bookmark created successfully."
      else
        return "Bookmark creation failed."
      end
    else
      return "Both author and tweet must be provided."
    end
  end

end
