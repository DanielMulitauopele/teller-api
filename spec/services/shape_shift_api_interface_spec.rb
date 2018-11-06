require 'rails_helper'

describe ShapeShiftApi do
  before (:each) do
    @shapeshift = ShapeShiftApi.new
  end
  it "exists" do
    expect(@shapeshift).to be_a(ShapeShiftApi)
  end
end
