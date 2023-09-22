class Quote < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  # Validations
  validates :content, length: { maximum: 255 }, presence: true

  #Scopes
  scope :quotes_from_author, ->(author_id) { where(author_id: author_id) }
end
