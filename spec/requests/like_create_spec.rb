require 'rails_helper'

RSpec.describe "Create Like", type: :request do
  describe "POST /tweets/:id/like" do

    it "creates a like successfully" do
      author = create(:author)
      tweet = create(:tweet, author: author)

      post "/api/tweets/#{tweet.id}/like", params: { author_id: author.id, tweet_id: tweet.id }, headers: { "ACCEPT" => "application/json" }

      expect(response).to have_http_status(201)

      expect(response).to match_response_schema("like_create")

    end
  end
end
