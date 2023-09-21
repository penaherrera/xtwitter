class Author < ApplicationRecord
    has_many :tweets
    has_many :bookmarks
    has_many :likes
    has_many :quotes
    has_many :replies
    has_many :retweets

    has_many :follower_relationships, class_name: "Follower", foreign_key: "following_username"
    has_many :followers, through: :follower_relationships, source: :follower

    has_many :following_relationships, class_name: "Follower", foreign_key: "follower_username"
    has_many :following, through: :following_relationships, source: :following
  
    #validations
    validates :email, uniqueness: true, presence: true
    validates :username, uniqueness: true, presence: true
    validates :password, presence: true, length: { minimum:12 }, format: {
      with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@\/\*\-\+\_])[A-Za-z\d!@\/\*\-\+\_\/\^\[\!\@\#\$\%\^\&\*\(\)\,\.\?\"\:\{\}\|\<\>\]\+\$\/]{8,}\z/,
    }

    validates_associated :tweet, :author, :bookmark, :like, :quote, :reply, :retweet
  end