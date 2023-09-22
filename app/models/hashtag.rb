class Hashtag < ApplicationRecord
    # validations
    validates :name, presence: true
  
    # Method to create a hashtag
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
        return "No repeated words found in the tweet."
      end
    end
  end
  