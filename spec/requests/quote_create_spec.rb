require 'rails_helper'

RSpec.describe "Quote Creation", type: :request do
  describe "POST /tweets/:id/quote" do

    it "creates a quote successfully" do
      author = create(:author)
      tweet = create(:tweet, author: author)
      authentication_token = JsonWebToken.encode({ sub: author.id })


      post "/api/tweets/#{tweet.id}/quote", 
      params: { content: 'this is a test quote', 
      author_id: author.id, tweet_id: tweet.id }, 
      headers: { "ACCEPT" => "application/json", 
      "Authorization": "Bearer #{authentication_token}" }

      expect(response).to have_http_status(201)
      expect(response).to match_response_schema('quote_and_reply_create')
      expect(authentication_token).not_to be_nil
      decoded_payload = JsonWebToken.decode(authentication_token)
      expect(decoded_payload["sub"]).to eq(Author.last.id)

    end

  end
end
