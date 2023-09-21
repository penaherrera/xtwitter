class Reply < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  #validations
  validates :content, length:{ maximum: 255 }, presence: true
  validates_associated :tweet, :author
end
