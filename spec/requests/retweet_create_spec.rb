require 'rails_helper'

RSpec.describe "Create Retweet", type: :request do
  describe "POST /tweets/:id/retweet" do

    it "creates a retweet successfully" do
      author2 = create(:author)
      tweet = create(:tweet, author: author2)
      author = create(:author)
      authentication_token = JsonWebToken.encode({ sub: author.id })

      post "/api/tweets/#{tweet.id}/retweet", params: { author_id: author2.id, 
      tweet_id: tweet.id }, 
      headers: { "ACCEPT" => "application/json",
      "Authorization": "Bearer #{authentication_token}"}

      expect(response).to have_http_status(201)
      expect(response).to match_response_schema("retweet_create")
      expect(authentication_token).not_to be_nil
      decoded_payload = JsonWebToken.decode(authentication_token)
      expect(decoded_payload["sub"]).to eq(Author.last.id)
    end
  end
end
