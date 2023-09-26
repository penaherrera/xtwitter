require 'rails_helper'

RSpec.describe Quote, type: :model do
  
  describe 'Associations' do
    it { should belong_to(:author) }
    it { should belong_to(:tweet) }
  end

  describe 'Validations' do
    it {should validate_length_of(:content).is_at_most(255)}
    it {should validate_presence_of(:content)}
  end


  describe 'Scopes' do
    describe '.quotes_from_author' do
      it 'returns quotes for a specific author' do

        author = create(:author)
        author2 = create(:author)
        tweet = create(:tweet, author: author)
        tweet2= create(:tweet, author: author)
  
        #this line is just to create the quote content with Faker
        quote = create(:quote, author: author2, tweet: tweet)
    
  
        Quote.create_quote(quote.content, author2, tweet)
        Quote.create_quote(quote.content, author2, tweet2)
        expect(Quote.where(author: author2, tweet: tweet)).to exist
        expect(Quote.where(author: author2, tweet: tweet2)).to exist

      end
    end
  end


  describe 'create_quote' do

    it 'creates a new quote' do

      author = create(:author)
      author2 = create(:author)
      tweet = create(:tweet, author: author)

      #this line is just to create the quote content with Faker
      quote = create(:quote, author: author2, tweet: tweet)
  

      create_quote = Quote.create_quote(quote.content, author2, tweet)
  
      expect(Quote.where(author: author2, tweet: tweet)).to exist
    end

  end

end
