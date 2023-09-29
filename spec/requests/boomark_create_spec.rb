require 'rails_helper'

RSpec.describe "Bookmark Creation", type: :request do
  describe "POST /tweets/:id/bookmark" do
    it "routes to the Bookmarks controller" do
      expect(post: "/tweets/1/bookmark").to route_to(controller: "bookmarks", action: "create", id: "1")
    end

    it "creates a bookmark successfully" do
      # Create an author and a tweet using FactoryBot
      author = create(:author)
      tweet = create(:tweet, author: author)

      # Define the bookmark creation parameters
      bookmark_params = { bookmark: {} }

      bookmark_json = bookmark_params.to_json

      post "/tweets/#{tweet.id}/bookmark", params: bookmark_json, headers: { 'Content-Type': 'application/json' }

      expect(response).to have_http_status(:success)

    end
  end
end
