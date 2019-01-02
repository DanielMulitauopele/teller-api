require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :price_usd}
    it {should validate_presence_of :percent_change_24_hr}
  end
  describe 'relationships' do
    it {should belong_to :user}
  end
end
