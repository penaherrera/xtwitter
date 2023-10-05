require 'rails_helper'

RSpec.describe "Api::Registrations", type: :request do
  describe "POST /api/register" do
    it "registers a new user and returns a JWT token" do
      registration_data = {
        author: create(:author)
      }

      post "/api/register", params: registration_data, headers: { "ACCEPT" => "application/json" }
      puts "Response Body: #{response.body}"

      expect(response).to have_http_status(201)
      expect(response).to match_response_schema("registration_response")
      response_json = JSON.parse(response.body)
      token = response_json["token"]

      expect(token).not_to be_nil
      expect(decoded_payload["author_id"]).to eq(Author.last.id)
    end
  end
end
