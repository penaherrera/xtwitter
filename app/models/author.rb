class Author < ApplicationRecord
    has_many :tweets
    has_many :bookmarks
    has_many :likes
    has_many :quotes
    has_many :replies
    has_many :retweets
    has_many :followers
    has_many :following
  end