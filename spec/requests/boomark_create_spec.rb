require 'rails_helper'

RSpec.describe "Bookmark Creation", type: :request do
  describe "POST /tweets/:id/bookmark" do
    it "creates a bookmark successfully" do
      author = create(:author)
      tweet = create(:tweet, author: author)

      bookmark_params = create(:bookmark, author: author, tweet: tweet)

      bookmark_json = bookmark_params.to_json

      post "/tweets/#{tweet.id}/bookmark", params: bookmark_json, headers: { 'Content-Type': 'application/json' }

      expect(response).to have_http_status(200)

      expect(response.body).to match_json_schema('bookmark_create.json')
    end
  end
end
