require 'rails_helper'

describe Snapshot do
  it "exists" do
    attributes = {}
    snapshot = Snapshot.new(attributes)

    expect(snapshot).to be_an(Snapshot)
  end
end
