require 'rails_helper'

describe 'Transactions API' do
  it "sends a list of most recent transactions" do
    get '/api/v1/transactions'

    expect(response).to be_successful
  end
end
