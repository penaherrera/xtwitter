require 'rails_helper'

RSpec.describe Retweet, type: :model do

  describe 'Associations' do
    it { should belong_to(:author) }
    it { should belong_to(:tweet) }
  end

  describe 'Scopes' do
    describe '.retweets_from_author' do
      it 'returns retweets for a specific author' do

        author = create(:author)
        author2 = create(:author)
        tweet = create(:tweet, author: author)
        tweet2= create(:tweet, author: author)
  
       
        retweet1 = create(:retweet, author: author2, tweet: tweet)
        retweet2 = create(:retweet, author: author2, tweet: tweet2)
    
        expect(Retweet.where(author: author2, tweet: tweet)).to exist
        expect(Retweet.where(author: author2, tweet: tweet2)).to exist

      end
    end
  end
end
