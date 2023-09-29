require 'rails_helper'

RSpec.describe "Unlike Tweet", type: :request do
  describe "DELETE /tweets/:id/unlike" do

    it "removes a like successfully" do
      author = create(:author)
      tweet = create(:tweet, author: author)
      like = create(:like, tweet: tweet, author: author)

      delete "/tweets/#{tweet.id}/unlike"

      expect(response).to have_http_status(200)

      expect(response).to match_json_schema("like_destroy.json")

      json_response = JSON.parse(response.body)

      expect(json_response["message"]).to eq("Like removed successfully")

      expect(Like.exists?(id: like.id)).to be_falsey
    end
  end
end
