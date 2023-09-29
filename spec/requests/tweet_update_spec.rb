require 'rails_helper'
require 'json-schema'

RSpec.describe "Tweet Update", type: :request do
  describe "PUT /tweets/:id/update" do
    it "routes to the Tweets controller" do
      expect(put: "/tweets/1/update").to route_to(controller: "tweets", action: "update", id: "1")
    end

    it "updates a tweet successfully with valid data" do
      author = create(:author)
      tweet = create(:tweet, author: author)

      valid_tweet_params = { tweet: { body: "Updated tweet body" } }

      valid_tweet_json = valid_tweet_params.to_json

      put "/tweets/#{tweet.id}/update", params: valid_tweet_json, headers: { 'Content-Type': 'application/json' }

      expect(response).to have_http_status(:success)

    end

    it "returns a validation error with invalid data" do
      author = FactoryBot.create(:author)
      tweet = FactoryBot.create(:tweet, author: author)

      invalid_tweet_params = { tweet: {} }

      invalid_tweet_json = invalid_tweet_params.to_json

      put "/tweets/#{tweet.id}/update", params: invalid_tweet_json, headers: { 'Content-Type': 'application/json' }

     # expect(response).to have_http_status(:unprocessable_entity)

      expect(response.body).to match_json_schema('tweet_update.json')

    end
  end
end
