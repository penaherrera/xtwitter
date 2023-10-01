require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  describe 'Associations' do
    it { should have_many(:taggings) }
    it { should have_many(:tweets) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe '.create_hashtag' do
    describe'A repeated word exists in the tweet body' do
      it 'creates a new hashtag' do
        author = create(:author)
        tweet = create(:tweet, author: author, body: 'This is a test tweet with test hashtag.')

        hashtag = Hashtag.create_hashtag(tweet)

        expect(hashtag).to eq("Hashtag created successfully")
      end
    end

    describe' no repeated word exists in the tweet body' do
      it 'returns a failure message' do
        author = create(:author)
        tweet = create(:tweet, author: author, body: 'This is a tweet with no repeated words.')

        result = Hashtag.create_hashtag(tweet)

        expect(result).to eq("Unable to create hashtag, no repeated words")
        expect(Hashtag.last).to be_nil
      end
    end
  end
end
