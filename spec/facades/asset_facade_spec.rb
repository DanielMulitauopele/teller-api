require 'rails_helper'

describe AssetFacade do
  it "should list out all assets" do
    af = AssetFacade.new
    assets = af.assets

    expect(assets).to be_an(Array)
    expect(assets.first).to be_an(Asset)
    expect(assets.last).to be_an(Asset)
  end
end
