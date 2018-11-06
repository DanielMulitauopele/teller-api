require 'rails_helper'

describe 'Assets API' do
  it "sends a list of assets" do
    get '/api/v1/assets'

    expect(response).to be_successful
  end
end
