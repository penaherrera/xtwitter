require 'rails_helper'

RSpec.describe "Create Like", type: :request do
  describe "POST /tweets/:id/like" do

    it "creates a like successfully" do
      author = create(:author)
      tweet = create(:tweet, author: author)

      # Generate a valid authentication token using the JsonWebToken class
      authentication_token = JsonWebToken.new.encode({ sub: author.id })

      post "/api/tweets/#{tweet.id}/like",
        params: { tweet_id: tweet.id },
        headers: {
          "ACCEPT" => "application/json",
          "Authorization" => "Bearer #{authentication_token}"
        }

      expect(response).to have_http_status(201)
      expect(response).to match_response_schema("like_create")
    end
  end
end
