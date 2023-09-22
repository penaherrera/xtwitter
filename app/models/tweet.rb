class Tweet < ApplicationRecord
  belongs_to :author
  has_many :replies
  has_many :quotes
  has_many :retweets
  #validations
  validates :body, length:{ maximum: 255 }, presence: true

  validates_associated :author

  #scopes
  scope :tweets_from_author, ->(author_id) { where(author_id: author_id) }


end
