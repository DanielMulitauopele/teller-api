require 'rails_helper'

describe 'Exchanges API' do
  describe 'valid request with auth' do
    before do
      user_params = { email: "rocket@email.com",
                      password: "GuardianOfTheGalaxy",
                      password_confirmation: "GuardianOfTheGalaxy"
                    }
      post '/users', params: { user: user_params }
      @user_teller_token = JSON.parse(response.body)["teller_api_token"]
    end

    it 'sends a list of exchanges' do
      get '/api/v1/exchanges', headers: {"Authorization" => "#{@user_teller_token}"}
      exchanges = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      expect(response.headers["Accept"]).to eq("application/json")
      expect(response.headers["Content-Type"]).to eq("application/json")

      expect(exchanges.class).to eq(Array)
      expect(exchanges[0].class).to eq(Hash)
      expect(exchanges[0]).to have_key("name")
      expect(exchanges[0]).to have_key("dollar_volume")
      expect(exchanges[0]).to have_key("volume_percentage")
      expect(exchanges[0]).to have_key("available_pairs")
      expect(exchanges[0]).to have_key("url")
      expect(exchanges[0]).to have_key("timestamp")

      expect(exchanges[0]["name"]).not_to be(nil)
      expect(exchanges[0]["dollar_volume"]).not_to be(nil)
      expect(exchanges[0]["volume_percentage"]).not_to be(nil)
      expect(exchanges[0]["available_pairs"]).not_to be(nil)
      expect(exchanges[0]["url"]).not_to be(nil)
      expect(exchanges[0]["timestamp"]).not_to be(nil)
    end
  end
  # describe 'invalid request' do
  #   describe 'without auth headers' do
  #     xit 'sends an error message' do
  #       get '/api/v1/exchanges'
  #       error = JSON.parse(response.body)
  #
  #       expect(response).to_not be_successful
  #       expect(response).to have_http_status(401)
  #       expect(error["error"]).to eq("Not authorized to make this request")
  #     end
  #   end
  #   describe 'with invalid credentials' do
  #     xit 'sends an error message' do
  #       get '/api/v1/exchanges', headers: {"Authorization" => "INVALID"}
  #       error = JSON.parse(response.body)
  #
  #       expect(response).to_not be_successful
  #       expect(response).to have_http_status(401)
  #       expect(error["error"]).to eq("Not authorized to make this request")
  #     end
  #   end
  # end
end
