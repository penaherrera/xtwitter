require 'rails_helper'

RSpec.describe "Api::Sessions", type: :request do
  describe "GET /create" do
    it "returns http success" do
      author = create(:author)
      authentication_token = JsonWebToken.encode({ id: author.id })
      
      get "/api/session/create", headers: { "ACCEPT" => "application/json",
      "Authorization": "Bearer #{authentication_token}"
    }
 
      expect(response).to have_http_status(:success)
      decoded_payload = JsonWebToken.decode(authentication_token)
      expect(decoded_payload["sub"]).to eq(Author.last.id)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/session/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
