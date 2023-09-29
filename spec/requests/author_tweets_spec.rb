require 'rails_helper'

RSpec.describe "Tweet Creation", type: :request do
  describe "POST /tweets/:id/create" do
    it "routes to the Tweets controller" do
      expect(post: "/tweets/1/create").to route_to(controller: "tweets", action: "create", id: "1")
    end

    it "creates a tweet successfully" do
      author = create(:author)

      tweet = create(:tweet, author: author)

      post "/tweets/#{author.id}/create"

      expect(response).to have_http_status(:success)
    end
  end
end
