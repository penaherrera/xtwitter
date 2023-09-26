require 'rails_helper'

RSpec.describe Bookmark, type: :model do

  describe 'Associations' do
    it { should belong_to(:author) }
    it { should belong_to(:tweet) }
  end

  describe 'Scopes' do
    describe '.bookmarks_from_author' do
      it 'returns bookmarks for all tweets created by another author' do

        author1 = create(:author)
        author2 = create(:author)

        tweet1 = create(:tweet, author: author1)
        tweet2 = create(:tweet, author: author1)
        tweet3 = create(:tweet, author: author1)

        create(:bookmark, author: author2, tweet: tweet1)
        create(:bookmark, author: author2, tweet: tweet2)
        create(:bookmark, author: author2, tweet: tweet3)


        bookmarks_for_author1 = Bookmark.bookmarks_from_author(author1.id)


        expect(Bookmark.where(author: author2, tweet: tweet1)).to exist
        expect(Bookmark.where(author: author2, tweet: tweet2)).to exist
        expect(Bookmark.where(author: author2, tweet: tweet3)).to exist

      end
    end
  end
  

  describe '.create_bookmark' do
    it 'creates a new bookmark' do
      author = create(:author)
      author2 = create(:author)
      tweet = create(:tweet, author: author)

      bookmark = Bookmark.create_bookmark(author2, tweet)

      expect(Bookmark.where(author: author2, tweet: tweet)).to exist
    end
  end
end
