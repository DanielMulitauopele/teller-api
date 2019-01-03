require 'rails_helper'

describe 'Transactions API' do
  describe 'valid request with auth' do
    before do
      user_params = { email: "drax@email.com",
                      password: "DraxTheDestroyer",
                      password_confirmation: "DraxTheDestroyer"
                    }
      post '/users', params: { user: user_params }
      @user_teller_token = JSON.parse(response.body)["teller_api_token"]
    end

    it 'sends a list of transactions' do
      get '/api/v1/transactions', headers: {"Authorization" => "#{@user_teller_token}"}
      transactions = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      expect(response.headers["Accept"]).to eq("application/json")
      expect(response.headers["Content-Type"]).to eq("application/json")

      expect(transactions.class).to eq(Array)
      expect(transactions[0].class).to eq(Hash)
    end
  end
  # describe 'invalid request' do
  #   describe 'without auth headers' do
  #     xit 'sends an error message' do
  #       get '/api/v1/transactions'
  #       error = JSON.parse(response.body)
  #
  #       expect(response).to_not be_successful
  #       expect(response).to have_http_status(401)
  #       expect(error["error"]).to eq("Not authorized to make this request")
  #     end
  #   end
  #   describe 'with invalid credentials' do
  #     xit 'sends an error message' do
  #       get '/api/v1/transactions', headers: {"Authorization" => "INVALID"}
  #       error = JSON.parse(response.body)
  #
  #       expect(response).to_not be_successful
  #       expect(response).to have_http_status(401)
  #       expect(error["error"]).to eq("Not authorized to make this request")
  #     end
  #   end
  # end
end
