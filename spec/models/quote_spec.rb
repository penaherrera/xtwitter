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


end
