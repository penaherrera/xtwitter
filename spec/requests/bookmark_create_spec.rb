require 'rails_helper'

RSpec.describe "Create Bookmark", type: :request do
  describe "POST /tweets/:id/bookmark" do

    it "creates a bookmark successfully" do
      author = create(:author)
      tweet = create(:tweet, author: author)

      post "/tweets/#{tweet.id}/bookmark", params: { author_id: author.id, tweet_id: tweet.id }

      expect(response).to have_http_status(201)

      expect(response).to match_response_schema("bookmark_create")

    end
  end
end
