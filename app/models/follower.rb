class Follower < ApplicationRecord
  belongs_to :follower, class_name: "Author", foreign_key: "follower_username", primary_key: "username"
  belongs_to :following, class_name: "Author", foreign_key: "following_username", primary_key: "username"

  # validations
  validates_uniqueness_of :follower_username, scope: :following_username
end
