require 'rails_helper'

RSpec.describe "Create Reply", type: :request do
  describe "POST /tweets/:id/reply" do

    it "creates a reply successfully" do
      author = create(:author)
      tweet = create(:tweet, author: author)


      post "/api/tweets/#{tweet.id}/reply", params: { content: 'This is a reply', author_id: author.id, tweet_id: tweet.id }, headers: { "ACCEPT" => "application/json" }

      expect(response).to have_http_status(201)

      expect(response).to match_response_schema('quote_and_reply_create')

    end
  end
end
