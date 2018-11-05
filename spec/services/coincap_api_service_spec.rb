require 'rails_helper'

describe 'CoinCapApiInterface' do
  it "should exist" do
    coincap = CoinCapApiInterface.new
    expect(coincap).to be_a(CoinCapApiInterface)
  end
end
