require 'rails_helper'

describe HistoryFacade do
  it "should return list of price changes by interval" do
    hf = HistoryFacade.new
    bitcoin_price = hf.history('bitcoin', 'h1')

    expect(bitcoin_price).to be_a(Hash)
    expect(bitcoin_price[:data]).to be_an(Array)
    expect(bitcoin_price[:data][0]).to have_key('price')
    expect(bitcoin_price[:data][0]).to have_key('time')
    expect(bitcoin_price[:data][0]).to have_key('circ_supply')
    expect(bitcoin_price[:data][0]).to have_key('date')
  end
end
