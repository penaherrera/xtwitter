require 'rails_helper'

RSpec.describe "Reply Creation", type: :request do
  describe "POST /tweets/:id/reply" do
    it "routes to the Replies controller" do
      expect(post: "/tweets/1/reply").to route_to(controller: "replies", action: "create", id: "1")
    end

    it "creates a reply successfully with valid data" do
      author = FactoryBot.create(:author)
      tweet = FactoryBot.create(:tweet, author: author)

      valid_reply_params = { reply: { content: "This is a test reply" } }

      valid_reply_json = valid_reply_params.to_json

      post "/tweets/#{tweet.id}/reply", params: valid_reply_json, headers: { 'Content-Type': 'application/json' }

      expect(response).to have_http_status(:success)

    end

    it "returns a validation error with invalid data" do
      author = FactoryBot.create(:author)
      tweet = FactoryBot.create(:tweet, author: author)

      invalid_reply_params = { reply: {} }

      invalid_reply_json = invalid_reply_params.to_json

      post "/tweets/#{tweet.id}/reply", params: invalid_reply_json, headers: { 'Content-Type': 'application/json' }

      expect(response).to have_http_status(:unprocessable_entity)

      expect(response.body).to match_json_schema('reply_create.json')

    end
  end
end
