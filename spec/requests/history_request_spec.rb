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
      @hour = "h1"
    end

    it "should return list of price changes by interval" do
      get "/api/v1/assets/#{@coin}/history?interval=#{@hour}", headers: {"Authorization" => "#{@user_teller_token}"}

      history = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      expect(response.headers["Accept"]).to eq("application/json")
      expect(response.headers["Content-Type"]).to eq("application/json")

      expect(history).to be_an(Array)
      expect(history.first).to be_an(Hash)

      expect(history.first).to have_key('price')
      expect(history.first).to have_key('time')
      expect(history.first).to have_key('supply')
      expect(history.first).to have_key('date')

      expect(history.first['price']).to_not eq(nil)
      expect(history.first['time']).to_not eq(nil)
      expect(history.first['supply']).to_not eq(nil)
      expect(history.first['date']).to_not eq(nil)
    end

    describe 'request does not have proper search params' do
      describe 'without interval' do
        it 'sends an error message' do
          get "/api/v1/assets/#{@coin}/history", headers: {"Authorization" => "#{@user_teller_token}"}
          error = JSON.parse(response.body)

          expect(response).to be_successful
          expect(error["error"]).to eq("Please choose a valid interval (m1, m5, m15, m30, h1, h2, h6, h12, d1) to examine history.")
        end
      end
    end
  end

  # describe 'invalid request' do
  #   describe 'without auth headers' do
  #     xit 'sends an error message' do
  #       get "/api/v1/assets/#{@coin}/history?interval=#{@hour}"
  #       error = JSON.parse(response.body)
  #
  #       expect(response).to_not be_successful
  #       expect(response).to have_http_status(401)
  #       expect(error["error"]).to eq("Not authorized to make this request")
  #     end
  #   end
  #   describe 'with invalid credentials' do
  #     xit 'sends an error message' do
  #       get "/api/v1/assets/#{@coin}/history?interval=#{@hour}", headers: {"Authorization" => "INVALID"}
  #       error = JSON.parse(response.body)
  #
  #       expect(response).to_not be_successful
  #       expect(response).to have_http_status(401)
  #       expect(error["error"]).to eq("Not authorized to make this request")
  #     end
  #   end
  # end
end
