require 'rails_helper'

RSpec.describe "Quote Creation", type: :request do
  describe "POST /tweets/:id/quote" do
    it "routes to the Quotes controller" do
      expect(post: "/tweets/1/quote").to route_to(controller: "quotes", action: "create", id: "1")
    end
# Ensure the response is successful
    it "creates a quote successfully with valid data" do
      author = create(:author)
      tweet = create(:tweet, author: author)

      valid_quote_params = { quote: { content: "This is a test quote" } }

      valid_quote_json = valid_quote_params.to_json

      post "/tweets/#{tweet.id}/quote", params: valid_quote_json, headers: { 'Content-Type': 'application/json' }

      expect(response).to have_http_status(:success)

    end

    it "returns a validation error with invalid data" do
      author = create(:author)
      tweet = create(:tweet, author: author)

      invalid_quote_params = { quote: {} }

      invalid_quote_json = invalid_quote_params.to_json

      post "/tweets/#{tweet.id}/quote", params: invalid_quote_json, headers: { 'Content-Type': 'application/json' }

      expect(response).to have_http_status(:unprocessable_entity)

      expect(response.body).to match_json_schema('quote_create.json')

    end
  end
end
