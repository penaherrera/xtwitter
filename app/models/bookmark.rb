class Bookmark < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  #Scopes
  scope :boorkmarks_from_author, ->(author_id) { where(author_id: author_id) }
end
