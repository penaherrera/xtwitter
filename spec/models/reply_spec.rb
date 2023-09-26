require 'rails_helper'

RSpec.describe Reply, type: :model do
  describe 'Associations' do
    it { should belong_to(:author) }
    it { should belong_to(:tweet) }
  end

  describe 'Validations' do
    it {should validate_length_of(:content).is_at_most(255)}
    it {should validate_presence_of(:content)}
  end

  describe 'Scopes' do
    describe '.replies_from_author' do
      it 'returns replies for a specific author' do

        author = create(:author)
        author2 = create(:author)
        tweet = create(:tweet, author: author)
        tweet2= create(:tweet, author: author)
  
        #this line is just to create the quote content with Faker
        reply1 = create(:reply, author: author2, tweet: tweet)
        reply2 = create(:reply, author: author2, tweet: tweet2)
    
        expect(Reply.where(author: author2, tweet: tweet)).to exist
        expect(Reply.where(author: author2, tweet: tweet2)).to exist

      end
    end
  end

end
