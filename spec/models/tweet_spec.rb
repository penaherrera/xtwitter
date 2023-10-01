require 'rails_helper'

RSpec.describe Tweet, type: :model do

  describe 'Associations' do
    it { should belong_to(:author) }
    it { should have_many(:replies) }
    it { should have_many(:quotes) }
    it { should have_many(:retweets) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_most(255) }
  end

  describe 'Scopes' do
    it 'returns tweets from a specific author' do
      author = create(:author) 
      tweet1 = create(:tweet, author: author)
      tweet2 = create(:tweet)

      result = Tweet.tweets_from_author(author.id)

      expect(result).to include(tweet1)
      expect(result).not_to include(tweet2)
    end
  end

  describe '.create_new_tweet' do
    it 'creates a new tweet' do
      author = create(:author) 
      body = 'This is a new tweet'

      result = Tweet.create_new_tweet(body, author)

      expect(result).to eq('A tweet was created successfully.')
      expect(Tweet.last.body).to eq(body)
      expect(Tweet.last.author).to eq(author)
    end

    it 'handles tweet creation failure' do
      author = create(:author) 
      body = nil 

      result = Tweet.create_new_tweet(body, author)

      expect(result).to eq('Tweet creation failed.')
      expect(Tweet.last).to be_nil
    end
  end
end
