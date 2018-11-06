require 'rails_helper'

describe ShapeShiftApiInterface do
  before (:each) do
    @shapeshift = ShapeShiftApiInterface.new
    VCR.use_cassette('get_market_info', record: :new_episodes) do
      @market_info = @shapeshift.get_market_info
    end
    VCR.use_cassette('get_coins', record: :new_episodes) do
      @ss_coins = @shapeshift.get_shape_shift_coins
    end
    VCR.use_cassette('get_transactions', record: :new_episodes) do
      @recent_txs = @shapeshift.get_recent_transactions
    end
  end

  it "exists" do
    expect(@shapeshift).to be_a(ShapeShiftApiInterface)
  end

  it "should return market info" do
    expect(@market_info).to be_an(Array)
    expect(@market_info.first).to be_a(Hash)
  end

  it "should return available shapeshift coins" do
    expect(@ss_coins).to be_a(Hash)
    expect(@ss_coins[:BTC]).to be_a(Hash)
  end

  it "should return recent transactions" do
    expect(@recent_txs).to be_an(Array)
    expect(@recent_txs.first).to be_a(Hash)
  end
end
