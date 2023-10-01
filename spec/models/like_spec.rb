require 'rails_helper'

RSpec.describe Like, type: :model do

  describe 'Associations' do
    it { should belong_to(:author) }
    it { should belong_to(:tweet) }
  end

  describe 'Validations' do
    let(:author) { create(:author) }
    let(:tweet) { create(:tweet) }

    it 'Scopes' do
      create(:like, author: author, tweet: tweet)

      like = build(:like, author: author, tweet: tweet)
      expect(like).to validate_uniqueness_of(:author_id).scoped_to(:tweet_id)
    end
  end


  describe '.create_like' do

    it 'creates a new like' do
      author = create(:author)
      tweet = create(:tweet, author: author)
      author2 = create(:author)

      like = Like.create_like(author2, tweet)

      expect(Like.where(author: author2, tweet: tweet)).to exist
    end

  end


  it 'handles like creation failure' do

    author = create(:author)
    tweet = create(:tweet, author: author)
    author2 = nil 

    like = Like.create_like(author2, tweet)

    expect(like).to eq('Both author and tweet must be provided.')
    expect(Like.last).to be_nil


  end
end
