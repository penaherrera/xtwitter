require 'rails_helper'

RSpec.describe "Create Bookmark", type: :request do
  describe "POST /tweets/:id/bookmark" do
    it "creates a bookmark successfully" do
      author = create(:author)
      tweet = create(:tweet, author: author)
      authentication_token = JsonWebToken.encode({ sub: author.id })

      post "/api/tweets/#{tweet.id}/bookmark", 
      params: { author_id: author.id, tweet_id: tweet.id }, 
      headers: { "ACCEPT": "application/json", 
      "Authorization": "Bearer #{authentication_token}"  }

      expect(response).to have_http_status(201)
      expect(authentication_token).not_to be_nil
      expect(response).to match_response_schema("bookmark_create")
      decoded_payload = JsonWebToken.decode(authentication_token)
      expect(decoded_payload["sub"]).to eq(Author.last.id)

    end
  end
end
#xtwitter/app/views/api/bookmarks/show.json.jbuilder