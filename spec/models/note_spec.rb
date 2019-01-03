require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :text}
  end
  describe 'relationships' do
    it {should belong_to :user}
  end
end
