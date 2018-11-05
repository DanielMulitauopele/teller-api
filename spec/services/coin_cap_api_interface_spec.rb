require 'rails_helper'

describe 'CoinCapApiInterface' do
  it "should exist" do
    coincap = CoinCapApiInterface.new
    expect(coincap).to be_a(CoinCapApiInterface)
  end
  it "should return coincap assets" do
    coincap = CoinCapApiInterface.new

    response = coincap.get_assets

    expect(response).to be_successful
    expect(response).to be_a(Hash)
    expect(response[:data]).to be_an(Array)
  end
end
