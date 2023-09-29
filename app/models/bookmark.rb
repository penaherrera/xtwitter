class Bookmark < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  scope :bookmarks_from_author, ->(author_id) { where(author_id: author_id) }

  def self.create_bookmark(author, tweet)
    if author && tweet
      new_bookmark = Bookmark.new(
        author_id: author.id,
        tweet_id: tweet.id,
      )

      if new_bookmark.save
        return new_bookmark.to_json
      else
        return "Bookmark creation failed."
      end
    else
      return "Both author and tweet must be provided."
    end
  end

end
