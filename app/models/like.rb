class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :author

  #validations



  validates_uniqueness_of :author_id, scope: :tweet_id
end
