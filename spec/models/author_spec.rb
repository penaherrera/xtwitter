require 'rails_helper'

RSpec.describe Author, type: :model do

    describe 'Associations' do
        it { should have_many(:tweets) }
        it { should have_many(:bookmarks) }
        it { should have_many(:likes) }
        it { should have_many(:quotes) }
        it { should have_many(:replies) }
        it { should have_many(:retweets) }
    end

    describe 'Validations' do
        it { should validate_uniqueness_of(:email) }
        it { should validate_presence_of(:email) }
        it { should validate_uniqueness_of(:username) }
        it { should validate_presence_of(:username) }
        it { should validate_presence_of(:password) }
        it { should validate_length_of(:password).is_at_least(12) }
    end
    
end
