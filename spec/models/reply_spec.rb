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
        content = 'this is the reply content'
  
        
        reply1 = Reply.create_reply(content, author2, tweet)
        reply2 = Reply.create_reply(content, author2, tweet)
        
        expect(Reply.replies_from_author(author2.id).count).to eq(2)       

      end
    end
  end

end
