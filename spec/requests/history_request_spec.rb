require 'rails_helper'

describe 'History API' do
  describe 'valid request with auth' do
    before do
      user_params = { email: "groot@email.com",
                      password: "IamGrootIamGroot",
                      password_confirmation: "IamGrootIamGroot"
                    }
      post '/users', params: { user: user_params }
      @user_teller_token = JSON.parse(response.body)["teller_api_token"]

      @coin = "bitcoin"
      @interval = "h1"
    end

    it "should return list of price changes by interval" do
      get "/api/v1/assets/#{@coin}/history?interval=#{@interval}", headers: {"Authorization" => "#{@user_teller_token}"}

      history = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      expect(response.headers["Accept"]).to eq("application/json")
      expect(response.headers["Content-Type"]).to eq("application/json")
    end
  end
end
