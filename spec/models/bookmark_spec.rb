require 'rails_helper'

RSpec.describe Bookmark, type: :model do

  describe 'Associations' do
    it { should belong_to(:author) }
    it { should belong_to(:tweet) }
  end

  describe 'Scopes' do
    it 'returns bookmarks from a specific author' do
      author = create(:author) 
      tweet = create(:tweet, author: author)
      
      result = Bookmark.boorkmarks_from_author(author.id)

      expect(result).to include(tweet)

    end
  end


end
