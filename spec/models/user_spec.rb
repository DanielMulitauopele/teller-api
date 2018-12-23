require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of :email}
  it {should validate_presence_of :password}
  it {should validate_presence_of :password_confirmation}
  it {should have_secure_password}
  it {should validate_length_of(:password).is_at_least(10)}
end
