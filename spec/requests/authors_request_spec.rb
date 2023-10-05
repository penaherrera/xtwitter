require 'rails_helper'

RSpec.describe 'Authors API', type: :request do
  describe 'GET /authors/:id' do

    it 'returns the correct author response in the JSON response' do
      author = create(:author)
      authentication_token = JsonWebToken.encode({ id: author.id })
      
      get "/api/authors/#{author.id}", 
      params: { id: author.id }, headers: { "ACCEPT" => "application/json",
      "Authorization": "Bearer #{authentication_token}"
    }
      #debugger
      expect(response).to have_http_status(200)
      # expect(response).to match_response_schema("author")
      # expect(authentication_token).not_to be_nil
      # decoded_payload = JsonWebToken.decode(authentication_token)
      # expect(decoded_payload["sub"]).to eq(Author.last.id)
 

    end
  end
end
