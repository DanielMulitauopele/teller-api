require 'rails_helper'

describe CoinCapApiInterface do
  before (:each) do
    @coincap = CoinCapApiInterface.new
    VCR.use_cassette('get_assets', record: :new_episodes) do
      @assets = @coincap.get_assets
    end
    VCR.use_cassette('get_rates', record: :new_episodes) do
      @rates = @coincap.get_rates
    end
    VCR.use_cassette('get_exchanges', record: :new_episodes) do
      @exchanges = @coincap.get_exchanges
    end
    VCR.use_cassette('get_markets', record: :new_episodes) do
      @markets = @coincap.get_markets
    end
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
    expect(@exchanges).to be_a(Hash)
    expect(@exchanges[:data]).to be_an(Array)
  end

  it "should return coincap markets" do
    expect(@markets).to be_a(Hash)
    expect(@markets[:data]).to be_an(Array)
  end
end
