class Hashtag < ApplicationRecord
    
  has_many :taggings
  has_many :tweets, through: :taggings
  validates :name, presence: true
  
    def self.create_hashtag(tweet)
      tweet_body = tweet.body
      tweet_body_array = tweet_body.split
  
      word_counts = {}
  
      hashtag_word = nil 
  
      tweet_body_array.each do |word|
        word = word.downcase
  
        if word_counts.key?(word)
          hashtag_word = "##{word}" 
          break 
        else
          word_counts[word] = 1
        end
      end
  

      if hashtag_word
        new_hashtag = Hashtag.new(
          name: hashtag_word
        )
  
        if new_hashtag.save
          return "Hashtag created successfully: #{hashtag_word}"
        else
          return "Hashtag creation failed."
        end
      else
        return "Unable to create hashtag, no repeated words"
      end
    end
  end
  