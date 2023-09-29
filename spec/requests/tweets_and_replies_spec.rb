require 'rails_helper'

RSpec.describe "Author Tweets and Replies", type: :request do
  describe "GET /authors/:id/tweets_and_replies" do

    it "returns author tweets and replies successfully" do
      author = create(:author)

      tweet1 = create(:tweet, author: author)
      tweet2 = create(:tweet, author: author)
      reply1 = create(:reply, author: author)
      reply2 = create(:reply, author: author)

      get "/authors/#{author.id}/tweets_and_replies"

      expect(response).to have_http_status(200)

      expect(response).to match_json_schema("author_tweets_and_replies")

      json_response = JSON.parse(response.body)

   
      expect(json_response).to be_an(Array)
      expect(json_response.size).to eq(4)

    end
  end
end
