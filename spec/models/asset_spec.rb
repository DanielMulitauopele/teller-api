require 'rails_helper'

describe Asset, type: :model do
  it {should validate_presence_of :name}
  it {should validate_presence_of :supply}
  it {should validate_presence_of :market_cap_usd}
  it {should validate_presence_of :price_usd}
end
