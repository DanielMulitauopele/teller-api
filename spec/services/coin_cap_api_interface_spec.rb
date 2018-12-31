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
    @thirty_minute = @coincap.get_history("bitcoin", "m30")
    @hour = @coincap.get_history("bitcoin", "h1")
    @two_hour = @coincap.get_history("bitcoin", "h2")
    @six_hour = @coincap.get_history("bitcoin", "h6")
    @twelve_hour = @coincap.get_history("bitcoin", "h12")
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

  it "should return 30 minute history of specific coin" do
    expect(@thirty_minute).to be_a(Hash)
    expect(@thirty_minute[:data]).to be_an(Array)
  end

  it "should return 1 hour history of specific coin" do
    expect(@hour).to be_a(Hash)
    expect(@hour[:data]).to be_an(Array)
  end

  it "should return 2 hour history of specific coin" do
    expect(@two_hour).to be_a(Hash)
    expect(@two_hour[:data]).to be_an(Array)
  end

  it "should return 6 hour history of specific coin" do
    expect(@six_hour).to be_a(Hash)
    expect(@six_hour[:data]).to be_an(Array)
  end

  it "should return 12 hour history of specific coin" do
    expect(@twelve_hour).to be_a(Hash)
    expect(@twelve_hour[:data]).to be_an(Array)
  end
end
