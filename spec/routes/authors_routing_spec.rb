require "rails_helper"

RSpec.describe "routes for Tweets", type: :routing do

    it "routes /authors/1/stats to the Tweets controller" do
        expect(get: "/authors/1/tweets").to route_to(controller: "tweets", action: "author_tweets", id: "1")
    end

    it "routes /authors/1/tweets_and_replies to the Tweets controller" do
        expect(get: "/authors/1/tweets").to route_to(controller: "tweets", action: "author_tweets_and_replies", id: "1")
    end
    
end