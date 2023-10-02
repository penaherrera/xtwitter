require 'rails_helper'

RSpec.describe 'Authors API', type: :request do
  describe 'GET /authors/:id' do
    let(:author) do
      Author.create(
        username: 'john_doe',
        name: 'John',
        lastname: 'Doe',
        email: 'john@example.com',
        password: 'password123',
        created_at: Time.now,
        updated_at: Time.now
      )
    end

    it 'returns the correct author name in the JSON response' do
      get "/authors/#{author.id}"

      expect(response).to have_http_status(200) 

      author_response = JSON.parse(response.body)
      expect(author_response['name']).to eq(author.name)
    end
  end
end
