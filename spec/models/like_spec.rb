require 'rails_helper'

RSpec.describe Like, type: :model do

  describe 'Associations' do
    it { should belong_to(:author) }
    it { should belong_to(:tweet) }
  end

  describe 'Validations' do
    let(:author) { create(:author) }
    let(:tweet) { create(:tweet) }

    it 'validates uniqueness of author_id within the scope of tweet_id' do
      create(:like, author: author, tweet: tweet)

      like = build(:like, author: author, tweet: tweet)
      expect(like).to validate_uniqueness_of(:author_id).scoped_to(:tweet_id)
    end
  end


  describe '.create_like' do

    it 'creates a new like' do
      author = create(:author)
      tweet = create(:tweet, author: author) 

      result = Like.create_like(author, tweet)

      expect(result).to eq('Like created successfully.')
      expect(Like.last.author).to eq(author)
      expect(Like.last.tweet).to eq(tweet)
    end

    it 'handles like creation failure with no author' do
      author = nil
      tweet = create(:tweet)
      result = Like.create_like(nil, tweet)
      expect(result).to eq('Both author and tweet must be provided.')
      expect(Like.last).to be_nil 
    end

    it 'handles like creation failure with no tweet' do
      author = create(:author)
      tweet = nil
      result = Like.create_like(author, tweet)
      expect(result).to eq('Both author and tweet must be provided.')
      expect(Like.last).to be_nil 
    end


  end
end
