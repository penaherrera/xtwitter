require 'rails_helper'

RSpec.describe "Quote Creation", type: :request do
  describe "POST /tweets/:id/quote" do

    it "creates a quote successfully" do
      author = create(:author)
      tweet = create(:tweet, author: author)
      
      post "/api/tweets/#{tweet.id}/quote", params: { content: 'this is a test quote', author_id: author.id, tweet_id: tweet.id }, headers: { "ACCEPT" => "application/json" }

      response_json = JSON.parse(response.body)
    
      # Access the "id" field from the response
      quote_id = response_json['id']
  
      # Output the quote_id for debugging purposes
      print "Quote ID: #{quote_id}"


    print response.body
    print tweet.id
      expect(response).to have_http_status(201)
      expect(response).to match_response_schema('quote_and_reply_create')


    end

  end
end
