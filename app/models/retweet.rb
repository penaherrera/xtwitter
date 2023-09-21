class Retweet < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  #validations

  validates :body, length: { maximum: 255 }, allow_nil: true

  validates_associated :tweet, :author
end
