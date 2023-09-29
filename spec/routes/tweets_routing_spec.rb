require "rails_helper"

RSpec.describe "routes for Tweets", type: :routing do

    it "routes /tweets/:id/stats to the Tweets controller" do
        expect(get: "/tweets/1/stats").to route_to(controller: "tweets", action: "tweet_stats", id: "1")
    end
      
    it "routes POST /tweets/:id/create to the Tweets controller" do
        expect(post: "/tweets/1/create").to route_to(controller: "tweets", action: "create", id: "1")
    end

    it "routes PUT /tweets/:id/update to the Tweets controller" do
        expect(put: "/tweets/1/update").to route_to(controller: "tweets", action: "update", id: "1")
    end

    it "routes POST /tweets/:id/reply to the Replies controller" do
        expect(post: "/tweets/1/reply").to route_to(controller: "replies", action: "create", id: "1")
    end

    it "routes POST /tweets/:id/quote to the Quotes controller" do
        expect(post: "/tweets/1/quote").to route_to(controller: "quotes", action: "create", id: "1")
    end

    it "routes POST /tweets/:id/retweet to the Retweets controller" do
        expect(post: "/tweets/1/retweet").to route_to(controller: "retweets", action: "create", id: "1")
    end
    
    it "routes POST /tweets/:id/bookmark to the Bookmarks controller" do
        expect(post: "/tweets/1/bookmark").to route_to(controller: "bookmarks", action: "create", id: "1")
    end

    it "routes POST /tweets/:id/like to the Likes controller" do
        expect(post: "/tweets/1/like").to route_to(controller: "likes", action: "create", id: "1")
    end

    it "routes POST /tweets/:id/unlike to the Likes controller" do
        expect(delete: "/tweets/1/unlike").to route_to(controller: "likes", action: "destroy", id: "1")
    end
      
end