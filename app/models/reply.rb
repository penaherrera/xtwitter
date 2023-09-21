class Reply < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  #validations
  validates :content, length:{ maximum: 255 }, presence: true
end
