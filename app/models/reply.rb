class Reply < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  validates :content, length:{ maximum: 255 }, presence: true

  scope :replies_from_author, ->(author_id) { where(author_id: author_id) }

end
