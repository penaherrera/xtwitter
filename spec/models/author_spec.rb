require 'rails_helper'

RSpec.describe Author, type: :model do
    it { should have_many(:tweets) }
    it { should have_many(:bookmarks) }
    it { should have_many(:likes) }
    it { should have_many(:quotes) }
    it { should have_many(:replies) }
    it { should have_many(:retweets) }
end
