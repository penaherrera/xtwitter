class Quote < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  # Validations
  validates :content, length: { maximum: 255 }, presence: true

end
