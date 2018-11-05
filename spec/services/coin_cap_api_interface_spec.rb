require 'rails_helper'

describe 'CoinCapApiInterface' do
  it "should exist" do
    coincap = CoinCapApiInterface.new
    expect(coincap).to be_a(CoinCapApiInterface)
  end
  it "should return coincap assets" do
    coincap = CoinCapApiInterface.new
    response = coincap.get_assets

    expect(response).to be_an(Array)
    expect(response.first).to be_a(Hash)
  end
  it "should return coincap rates" do
    coincap = CoinCapApiInterface.new
    response = coincap.get_rates

    expect(response).to be_a(Hash)
    expect(response[:data]).to be_an(Array)
  end
  it "should return coincap exchanges" do
    coincap = CoinCapApiInterface.new
    response = coincap.get_exchanges

    expect(response).to be_a(Hash)
    expect(response[:data]).to be_an(Array)
  end
  it "should return coincap markets" do
    coincap = CoinCapApiInterface.new
    response = coincap.get_markets

    expect(response).to be_a(Hash)
    expect(response[:data]).to be_an(Array)
  end
end
