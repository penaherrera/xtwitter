class Retweet < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  #validations



end
