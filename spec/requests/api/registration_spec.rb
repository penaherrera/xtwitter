require 'rails_helper'

RSpec.describe "Api::Registrations", type: :request do
  describe "POST /api/register" do
    it "registers a new user and returns a JWT token" do
      registration_data = {
        author: {
          username: "dottest",
          name: "test.com",
          lastname: "test.com",
          email: "test@test.com",
          password: "IoooGooo123!!!"
        }
      }

      post "/api/register", params: registration_data, headers: { "ACCEPT" => "application/json" }

      expect(response).to have_http_status(201)

      response_json = JSON.parse(response.body)
      token = response_json["token"]

      expect(token).not_to be_nil
      decoded_payload = JsonWebToken.decode(token)
      expect(decoded_payload["author_id"]).to eq(Author.last.id)
    end
  end
end
