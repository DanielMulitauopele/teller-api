require 'rails_helper'

describe 'CoinCapApiInterface' do
  it "should exist" do
    coincap = CoinCapApiInterface.new
    expect(coincap).to be_a(CoinCapApiInterface)
  end
  it "should return coincap assets" do
    coincap = CoinCapApiInterface.new

    response = coincap.get_assets
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(parsed).to be_a(Hash)
    expect(parsed[:data]).to be_an(Array)
  end
end
