require 'rails_helper'

describe 'Exchange API' do
  it "sends a list of exchanges" do
    get '/api/v1/exchanges'

    expect(response).to be_successful
  end
end
