require 'rails_helper'

describe ShapeShiftApiInterface do
  before (:each) do
    @shapeshift = ShapeShiftApiInterface.new
  end

  it "exists" do
    expect(@shapeshift).to be_a(ShapeShiftApiInterface)
  end

  it "should return market info" do

  end
end
