require 'rails_helper'

describe HistoryFacade do
  it "should return list of price changes by interval" do
    hf = HistoryFacade.new
    bitcoin_price_history = hf.history('bitcoin', 'h1')

    expect(bitcoin_price_history).to be_a(Array)
    expect(bitcoin_price_history.first).to be_a(Snapshot)
    expect(bitcoin_price_history.last).to be_a(Snapshot)
  end
end
