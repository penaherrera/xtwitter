class Quote < ApplicationRecord
  belongs_to :tweet
  belongs_to :author


  #validations
  validates :body, length:{ maximum: 255 }, presence: true


  validates_associated :tweet, :author
end
