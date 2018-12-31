require 'rails_helper'

describe CoinCapApiInterface do
  before (:each) do
    @coincap = CoinCapApiInterface.new
    @assets = @coincap.get_assets
    @rates = @coincap.get_rates
    @exchanges = @coincap.get_exchanges
    @markets = @coincap.get_markets
    @minute = @coincap.get_history("bitcoin", "m1")
    @five_minute = @coincap.get_history("bitcoin", "m5")
    @fifteen_minute = @coincap.get_history("bitcoin", "m15")
  end

  it "exists" do
    expect(@coincap).to be_a(CoinCapApiInterface)
  end

  it "should return coincap assets" do
    expect(@assets).to be_an(Array)
    expect(@assets.first).to be_a(Hash)
  end

  it "should return coincap rates" do
    expect(@rates).to be_a(Hash)
    expect(@rates[:data]).to be_an(Array)
  end

  it "should return coincap exchanges" do
    expect(@exchanges).to be_an(Array)
    expect(@exchanges.first).to be_an(Hash)
  end

  it "should return coincap markets" do
    expect(@markets).to be_a(Hash)
    expect(@markets[:data]).to be_an(Array)
  end

  it "should return minute history of specific coin" do
    expect(@minute).to be_a(Hash)
    expect(@minute[:data]).to be_an(Array)
  end

  it "should return 5 minute history of specific coin" do
    expect(@five_minute).to be_a(Hash)
    expect(@five_minute[:data]).to be_an(Array)
  end

  it "should return 15 minute history of specific coin" do
    expect(@fifteen_minute).to be_a(Hash)
    expect(@fifteen_minute[:data]).to be_an(Array)
  end
end
