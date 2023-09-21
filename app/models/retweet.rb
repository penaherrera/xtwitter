class Retweet < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  #validations
  


  validates_associated :tweet, :author
end
