require 'rails_helper'

RSpec.describe "Create Like", type: :request do
  describe "POST /tweets/:id/like" do

    it "creates a like successfully" do
      author = create(:author)
      tweet = create(:tweet, author: author)

      post "/tweets/#{tweet.id}/like"

      expect(response).to have_http_status(200)

      expect(response).to match_json_schema("like_create.json")

      json_response = JSON.parse(response.body)

      expect(json_response["id"]).to be_a(Integer)

    end
  end
end
