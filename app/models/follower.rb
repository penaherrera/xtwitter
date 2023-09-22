class Follower < ApplicationRecord
  belongs_to :follower, class_name: "Author", foreign_key: "follower_username", primary_key: "username"
  belongs_to :following, class_name: "Author", foreign_key: "following_username", primary_key: "username"

  validates_uniqueness_of :follower_username, scope: :following_username

  scope :followers_from_author, ->(author_id) { where(author_id: author_id) }

end
