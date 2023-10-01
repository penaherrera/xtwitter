require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe 'Associations' do
    it { should belong_to(:hashtag) }
    it { should belong_to(:tweet) }
  end
end
