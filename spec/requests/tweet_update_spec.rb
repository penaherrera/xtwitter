require 'rails_helper'

RSpec.describe "Tweet Update", type: :request do
  describe "PUT /tweets/:id/update" do

    it "updates a tweet successfully" do
      initial_tweet = create(:tweet, body: "Initial tweet body")

      updated_body = "Updated tweet body"
      put "/tweets/#{initial_tweet.id}/update", params: { body: updated_body }

      expect(response).to have_http_status(200)

      expect(response).to match_response_schema("tweet")
      
      updated_tweet = initial_tweet.reload

      expect(updated_tweet.body).to eq(updated_body)
      
    end
  end
end
