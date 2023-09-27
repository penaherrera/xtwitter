class Follower < ApplicationRecord
  belongs_to :follower, class_name: "Author", foreign_key: "follower_id"
  belongs_to :following, class_name: "Author", foreign_key: "following_id"

  
  validates_uniqueness_of :follower_id, scope: :following_id

  scope :followers_from_author, ->(author_id) { where(follower_author_id: author_id) }
end
