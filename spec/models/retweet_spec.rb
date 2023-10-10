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
    
        expect(Retweet.retweets_from_author(author2.id).count).to eq(2)       

      end
    end
  end

  describe '.create_retweet' do
    it 'creates a new retweet' do
      author = create(:author)
      tweet = create(:tweet, author: author)
      author2 = create(:author)

     retweet = Retweet.create_retweet(author2,tweet)
      expect(Retweet.last.author).to eq(author2)
    end

    it 'handles tweet creation failure' do
      author = create(:author)
      tweet = create(:tweet, author: author)
      author2 = nil
    
      retweet = build(:retweet, author: author2, tweet: tweet)
      
      expect(retweet).to be_invalid
    end
  end

end
