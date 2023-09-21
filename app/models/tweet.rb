class Tweet < ApplicationRecord
  belongs_to :author
  has_many :replies
  #validations

  validates_associated :author
end
