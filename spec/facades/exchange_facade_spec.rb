require 'rails_helper'

describe ExchangeFacade do
  it "should list out all recent transactions" do
    ef = ExchangeFacade.new
    exchanges = ef.exchanges

    expect(exchanges).to be_an(Array)
    expect(exchanges.first).to be_a(Exchange)
    expect(exchanges.last).to be_a(Exchange)
  end
end
