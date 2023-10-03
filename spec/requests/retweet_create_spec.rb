require 'rails_helper'

RSpec.describe "Create Retweet", type: :request do
  describe "POST /tweets/:id/retweet" do

    it "creates a retweet successfully" do
      author2 = create(:author)
      tweet = create(:tweet, author: author2)
      author = create(:author)

      post "/api/tweets/#{tweet.id}/retweet", params: { author_id: author2.id, tweet_id: tweet.id }, headers: { "ACCEPT" => "application/json" }

      expect(response).to have_http_status(201)

      expect(response).to match_response_schema("retweet_create")

    end
  end
end
