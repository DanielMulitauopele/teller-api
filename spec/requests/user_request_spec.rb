require 'rails_helper'

describe 'POST /users' do
  describe 'valid request' do
    it 'returns an auth token to the user' do
      user_params = {email: "R2D2@email.com", password: "SeeThreePio", password_confirmation: "SeeThreePio"}
      post '/users', params: {user: user_params}

      user = User.last
      user_teller_token = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response).to have_http_status(201)

      expect(user_teller_token).to have_key("teller_api_token")

      expect(response.headers["Accept"]).to eq("application/json")
      expect(response.headers["Content-Type"]).to eq("application/json")

      expect(user.email).to eq(user_params[:email])
    end
  end
  describe 'invalid request' do
    describe 'without email' do
      it 'sends an error message' do
        user_params = {password: "SeeThreePio", password_confirmation: "SeeThreePio"}
        post '/users', params: {user: user_params}

        error = JSON.parse(response.body)

        expect(response).to_not be_successful
        expect(response).to have_http_status(400)
        expect(error["error"]).to eq("Unfortunately, your account could not be created. Please make sure your password is longer than 10 characters.")
      end
    end
    describe 'without password' do
      it 'sends an error message' do
        user_params = {email: "R2D2@email.com", password: "", password_confirmation: ""}
        post '/users', params: {user: user_params}

        error = JSON.parse(response.body)

        expect(response).to_not be_successful
        expect(response).to have_http_status(400)
        expect(error["error"]).to eq("Unfortunately, your account could not be created. Please make sure your password is longer than 10 characters.")
      end
    end
    describe 'with mismatched password & password_confirmation' do
      it 'sends an error message' do
        user_params = {email: "R2D2@email.com", password: "MISMATCHED1", password_confirmation: "MISMATCHED2"}
        post '/users', params: {user: user_params}

        error = JSON.parse(response.body)

        expect(response).to_not be_successful
        expect(response).to have_http_status(400)
        expect(error["error"]).to eq("Unfortunately, your account could not be created. Please make sure your password is longer than 10 characters.")
      end
    end
    describe 'with incorrect password length' do
      it 'sends an error message' do
        user_params = {email: "R2D2@email.com", password: "2short", password_confirmation: "2short"}
        post '/users', params: {user: user_params}

        error = JSON.parse(response.body)

        expect(response).to_not be_successful
        expect(response).to have_http_status(400)
        expect(error["error"]).to eq("Unfortunately, your account could not be created. Please make sure your password is longer than 10 characters.")
      end
    end
  end
end
