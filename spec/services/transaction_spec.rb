require 'rails_helper'

describe Transaction do
  it "exists" do
    attributes = {}
    tx = Transaction.new(attributes)

    expect(tx).to be_an(Transaction)
  end
end
