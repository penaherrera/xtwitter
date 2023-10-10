require 'rails_helper'

RSpec.describe "Tweet Creation", type: :request do
  describe "POST /tweets/:id/create" do

    it "creates a tweet successfully" do
      author = create(:author)
      authentication_token = JsonWebToken.encode({ sub: author.id })

      post "/api/tweets",
       params: { body: "This is a test tweet", author_id: author.id, },
       headers: {
        "ACCEPT": "application/json",
        "Authorization": "Bearer #{authentication_token}"
       }



      expect(response).to have_http_status(201)
      expect(response).to match_response_schema("tweet")
      expect(authentication_token).not_to be_nil
      decoded_payload = JsonWebToken.decode(authentication_token)
      expect(decoded_payload["sub"]).to eq(Author.last.id)
    end
  end
end
