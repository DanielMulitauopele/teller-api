require 'rails_helper'

describe CoinCapApiInterface do
  before (:each) do
    @coincap = CoinCapApiInterface.new
    @assets = @coincap.get_assets
    @bitcoin = @coincap.get_asset('bitcoin')
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
    @day = @coincap.get_history("bitcoin", "d1")
  end

  it "exists" do
    expect(@coincap).to be_a(CoinCapApiInterface)
  end

  it "should return coincap assets" do
    expect(@assets).to be_an(Array)
    expect(@assets.first).to be_a(Hash)
  end

  it "should return specific coincap asset" do
    expect(@bitcoin).to be_an(Hash)
    expect(@bitcoin[:data]).to be_a(Hash)
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
    expect(@markets.first).to be_an(Array)
  end

  it "should return minute history of specific coin" do
    expect(@minute).to be_a(Array)
    expect(@minute.first).to be_an(Hash)
  end

  it "should return 5 minute history of specific coin" do
    expect(@five_minute).to be_a(Array)
    expect(@five_minute.first).to be_an(Hash)
  end

  it "should return 15 minute history of specific coin" do
    expect(@fifteen_minute).to be_a(Array)
    expect(@fifteen_minute.first).to be_an(Hash)
  end

  it "should return 30 minute history of specific coin" do
    expect(@thirty_minute).to be_a(Array)
    expect(@thirty_minute.first).to be_an(Hash)
  end

  it "should return 1 hour history of specific coin" do
    expect(@hour).to be_a(Array)
    expect(@hour.first).to be_an(Hash)
  end

  it "should return 2 hour history of specific coin" do
    expect(@two_hour).to be_a(Array)
    expect(@two_hour.first).to be_an(Hash)
  end

  it "should return 6 hour history of specific coin" do
    expect(@six_hour).to be_a(Array)
    expect(@six_hour.first).to be_an(Hash)
  end

  it "should return 12 hour history of specific coin" do
    expect(@twelve_hour).to be_a(Array)
    expect(@twelve_hour.first).to be_an(Hash)
  end

  it "should return day history of specific coin" do
    expect(@day).to be_a(Array)
    expect(@day.first).to be_an(Hash)
  end
end
