require 'rails_helper'

RSpec.describe Follower, type: :model do
  describe "Associations" do
    it { should belong_to(:follower_author).class_name("Author").with_foreign_key("follower_id") }
    it { should belong_to(:following_author).class_name("Author").with_foreign_key("following_id") }
  end


  describe "Validations" do
    it "should validate uniqueness of follower_id scoped to following_id" do
      # Create an Author instance to use as the follower and following
      follower_author = FactoryBot.create(:author)
      following_author = FactoryBot.create(:author)

      # Create a Follower instance with valid attributes
      FactoryBot.create(:follower, follower_author: follower_author, following_author: following_author)

      # Attempt to create a duplicate Follower instance
      duplicate_follower = FactoryBot.build(:follower, follower_author: follower_author, following_author: following_author)

      # Expect the duplicate_follower to be invalid due to uniqueness validation
      expect(duplicate_follower).not_to be_valid
    end
  end


  describe "Scopes" do
    it "should have a scope 'followers_from_author'" do
      author = FactoryBot.create(:author)
      follower1 = FactoryBot.create(:follower, following_author: author)
      follower2 = FactoryBot.create(:follower, following_author: author)

      expect(Follower.followers_from_author(author.id)).to eq([follower1, follower2])
    end
  end
end
