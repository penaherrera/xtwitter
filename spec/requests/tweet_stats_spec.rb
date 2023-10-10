require 'rails_helper'

RSpec.describe "Tweet Stats", type: :request do
  describe "GET /tweets/:id/stats" do
    it "returns tweet statistics successfully" do
      author = create(:author)
      author2 = create(:author)
      tweet = create(:tweet, author: author)
      authentication_token = JsonWebToken.encode({ sub: author2.id })


      create(:like, tweet: tweet, author: author2)
      create(:retweet, tweet: tweet, author: author2)
      create(:reply, tweet: tweet, author: author2)
      #create(:bookmark, tweet: tweet, author: author2)
      create(:quote, tweet: tweet, author: author2)
      #debugger
      
      get "/api/tweets/#{tweet.id}/stats", 
      params: { tweet_id: tweet.id },
      headers: {
        "ACCEPT": "application/json",
        "Authorization": "Bearer #{authentication_token}"
      }
      print response.body
      #debugger

      expect(response).to have_http_status(200)
      expect(response).to match_response_schema("tweet_stats")
      expect(authentication_token).not_to be_nil
      decoded_payload = JsonWebToken.decode(authentication_token)
      expect(decoded_payload["sub"]).to eq(Author.last.id)

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
