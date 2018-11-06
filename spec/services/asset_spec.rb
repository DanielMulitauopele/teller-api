require 'rails_helper'

describe Asset do
  it "exists" do
    attributes = {}
    asset = Asset.new(attributes)

    expect(asset).to be_an(Asset)
  end
end
