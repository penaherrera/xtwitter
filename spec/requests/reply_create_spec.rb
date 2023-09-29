require 'rails_helper'

RSpec.describe "Create Reply", type: :request do
  describe "POST /tweets/:id/reply" do

    it "creates a reply successfully" do
      author = create(:author)
      tweet = create(:tweet, author: author)

      reply_content = "This is a reply."
      post "/tweets/#{tweet.id}/reply", params: { content: reply_content }

      expect(response).to have_http_status(200)

      expect(response).to match_json_schema('quote_and_reply_create.json')

      json_response = JSON.parse(response.body)

      expect(json_response["content"]).to eq(reply_content)
    end
  end
end
