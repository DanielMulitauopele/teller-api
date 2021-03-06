require 'rails_helper'

describe 'Assets API' do
  describe 'valid request with auth' do
    before do
      user_params = { email: "groot@email.com",
                      password: "IamGrootIamGroot",
                      password_confirmation: "IamGrootIamGroot"
                    }
      post '/users', params: { user: user_params }
      @user_teller_token = JSON.parse(response.body)["teller_api_token"]
    end

    it 'sends a list of assets' do
      get '/api/v1/assets', headers: {"Authorization" => "#{@user_teller_token}"}
      assets = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      expect(response.headers["Accept"]).to eq("application/json")
      expect(response.headers["Content-Type"]).to eq("application/json")

      expect(assets.class).to eq(Array)
      expect(assets[0].class).to eq(Hash)

      expect(assets[0]).to have_key("name")
      expect(assets[0]).to have_key("rank")
      expect(assets[0]).to have_key("symbol")
      expect(assets[0]).to have_key("price_usd")
      expect(assets[0]).to have_key("percent_change_24_hr")

      expect(assets[0]["name"]).not_to be(nil)
      expect(assets[0]["rank"]).not_to be(nil)
      expect(assets[0]["symbol"]).not_to be(nil)
      expect(assets[0]["price_usd"]).not_to be(nil)
      expect(assets[0]["percent_change_24_hr"]).not_to be(nil)
    end
    it "sends a specific asset" do
      get '/api/v1/assets/bitcoin', headers: {"Authorization" => "#{@user_teller_token}"}
      bitcoin = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      expect(response.headers["Accept"]).to eq("application/json")
      expect(response.headers["Content-Type"]).to eq("application/json")

      expect(bitcoin.class).to eq(Hash)

      expect(bitcoin).to have_key("name")
      expect(bitcoin).to have_key("rank")
      expect(bitcoin).to have_key("symbol")
      expect(bitcoin).to have_key("price_usd")
      expect(bitcoin).to have_key("percent_change_24_hr")

      expect(bitcoin["name"]).not_to be(nil)
      expect(bitcoin["rank"]).not_to be(nil)
      expect(bitcoin["symbol"]).not_to be(nil)
      expect(bitcoin["price_usd"]).not_to be(nil)
      expect(bitcoin["percent_change_24_hr"]).not_to be(nil)
    end
  end
  # describe 'invalid request' do
  #   describe 'without auth headers' do
  #     xit 'sends an error message' do
  #       get '/api/v1/assets'
  #       error = JSON.parse(response.body)
  #
  #       expect(response).to_not be_successful
  #       expect(response).to have_http_status(401)
  #       expect(error["error"]).to eq("Not authorized to make this request")
  #     end
  #   end
  #   describe 'with invalid credentials' do
  #     xit 'sends an error message' do
  #       get '/api/v1/assets', headers: {"Authorization" => "INVALID"}
  #       error = JSON.parse(response.body)
  #
  #       expect(response).to_not be_successful
  #       expect(response).to have_http_status(401)
  #       expect(error["error"]).to eq("Not authorized to make this request")
  #     end
  #   end
  # end
end
