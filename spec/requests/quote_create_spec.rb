require 'rails_helper'

RSpec.describe "Quote Creation", type: :request do
  describe "POST /tweets/:id/quote" do

    it "creates a quote successfully" do
      author = create(:author)
      tweet = create(:tweet, author: author)

      quote = create(:quote, author: author, tweet: tweet)

      quote_json = quote.to_json

      post "/tweets/#{tweet.id}/quote", params: quote_json, headers: { 'Content-Type': 'application/json' }

      expect(response).to have_http_status(200)
      expect(response.body).to match_json_schema('quote_and_reply_create')


    end

  end
end
