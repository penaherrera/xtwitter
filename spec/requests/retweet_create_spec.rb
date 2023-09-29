require 'rails_helper'

RSpec.describe "Create Retweet", type: :request do
  describe "POST /tweets/:id/retweet" do

    it "creates a retweet successfully" do
      author = create(:author)
      author2 = create(:author)
      tweet = create(:tweet, author: author2)

      post "/tweets/#{tweet.id}/retweet"

      expect(response).to have_http_status(200)

      expect(response).to match_json_schema("retweet_create.json")

      json_response = JSON.parse(response.body)

      expect(json_response["body"]).to eq(tweet.body)      
    end
  end
end
