require 'rails_helper'

describe 'POST /authentications' do
  describe 'valid request' do
    it 'returns an auth token to the user' do
      user_params = {email: "Nebula@email.com", password: "StarLordisthebest", password_confirmation: "StarLordisthebest"}
      post '/users', params: {user: user_params}

      user = User.last
      login_params = {email: user.email, password: "StarLordisthebest"}
      post '/authentications', params: login_params
      login_response = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      expect(login_response).to have_key("teller_api_token")
      expect(login_response["teller_api_token"]).not_to be(nil)

      expect(response.headers["Accept"]).to eq("application/json")
      expect(response.headers["Content-Type"]).to eq("application/json")
    end
  end
  describe 'invalid request' do
    describe 'without email' do
      it 'sends an error message' do
        user_params = {email: "Nebula@email.com", password: "StarLordisthebest", password_confirmation: "StarLordisthebest"}
        post '/users', params: {user: user_params}

        login_params = {password: "SeeThreePio"}
        post '/authentications', params: login_params

        error = JSON.parse(response.body)

        expect(response).to_not be_successful
        expect(response).to have_http_status(401)
        expect(error["error"]["user_authentication"][0]).to eq("This email and password combination is invalid.")
      end
    end
    describe 'without password' do
      it 'sends an error message' do
        user_params = {email: "Nebula@email.com", password: "StarLordisthebest", password_confirmation: "StarLordisthebest"}
        post '/users', params: {user: user_params}

        login_params = {email: "R2D2@email.com"}
        post '/authentications', params: login_params

        error = JSON.parse(response.body)

        expect(response).to_not be_successful
        expect(response).to have_http_status(401)
        expect(error["error"]["user_authentication"][0]).to eq("This email and password combination is invalid.")
      end
    end
    describe 'with mismatched email & password' do
      it 'sends an error message' do
        user_params = {email: "Nebula@email.com", password: "StarLordisthebest", password_confirmation: "StarLordisthebest"}
        post '/users', params: {user: user_params}

        login_params = {email: "Nebula@email.com", password: "MISMATCHED"}
        post '/authentications', params: login_params

        error = JSON.parse(response.body)

        expect(response).to_not be_successful
        expect(response).to have_http_status(401)
        expect(error["error"]["user_authentication"][0]).to eq("This email and password combination is invalid.")
      end
    end
  end
end
