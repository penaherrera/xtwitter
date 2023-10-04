require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'JWT authentication' do
    it 'authenticates with a valid JWT token' do
      user = create(:user)
      jwt_token = user.generate_jwt_token

      decoded_token = JsonWebToken.decode(jwt_token)

      expect(decoded_token['sub']).to eq(user.id)
    end
  end
end
