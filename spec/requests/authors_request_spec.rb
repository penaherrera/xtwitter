require 'rails_helper'

RSpec.describe 'Authors API', type: :request do
  describe 'GET /authors/:id' do

    it 'returns the correct author response in the JSON response' do
      author = create(:author)

      get "/api/authors/#{author.id}", params: { id: author.id }, headers: { "ACCEPT" => "application/json" }

      expect(response).to have_http_status(200)
      
      expect(response).to match_response_schema("author")
 

    end
  end
end
