require 'rails_helper'

RSpec.describe "Tweet Creation", type: :request do
  describe "POST /tweets/:id/create" do

    it "creates a tweet successfully" do
      author = create(:author)
      author_id = author.id
      post "/tweets/#{author.id}/create", params: { body: "This is a test tweet", author_id: author.id }

      puts response.body

      expect(response).to have_http_status(201)
      expect(response).to match_response_schema("tweet")
    end
  end
end
