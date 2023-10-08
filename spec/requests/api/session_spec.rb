require 'rails_helper'

RSpec.describe "API::Session", type: :request do
  describe 'POST /api/login' do
    it 'creates a session and returns a token for valid credentials' do
      author = create(:author, email: 'valid_email@example.com', password: 'Valid_password123!@#')

      post '/api/login', params: { author: { email: 'valid_email@example.com', password: 'Valid_password123!@#' } }
      #debugger
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to have_key('token')
    end

    #  it 'returns an error for invalid credentials' do
    #    post '/api/login', params: { author: { email: 'invalid_email@example.com', password: 'invalid_password' } }

    #    expect(response).to have_http_status(:unauthorized)
    #    expect(JSON.parse(response.body)).to have_key('errors')
    #  end
  end

   describe 'DELETE /api/logout' do
     it 'destroys the session and logs the user out' do
       author = create(:author)
       authentication_token = JsonWebToken.encode(sub: author.id)
       request_headers = { 'Authorization' => "Bearer #{authentication_token}" }

      delete '/api/logout', headers: request_headers

      expect(response).to have_http_status(:success)
      expect(session[:author_id]).to be_nil
    end
  end
end
