require 'rails_helper'

describe Exchange do
  it "exists" do
    attributes = {}
    exchange = Exchange.new(attributes)

    expect(exchange).to be_an(Exchange)
  end
end
