require 'rails_helper'

describe 'Assets API' do
  before do
    user_params = { email: "groot@email.com",
                    password: "IamGrootIamGroot",
                    password_confirmation: "IamGrootIamGroot"
                  }
    post '/users', params: { user: user_params }

    @user_teller_token = JSON.parse(response.body)["teller_api_token"]
  end

  it "sends a list of assets" do
    get '/api/v1/assets', headers: {"Authorization" => "#{@user_teller_token}"}

    expect(response).to be_successful
    expect(response).to have_http_status(200)
  end
end
