require 'rails_helper'

describe 'Assets API' do
  it "sends a list of assets" do
    attributes = {}
    asset_1 = Asset.new(attributes)
    asset_2 = Asset.new(attributes)

    get '/api/v1/assets'

    expect(response).to be_successful
  end
end
