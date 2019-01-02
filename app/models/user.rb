class User < ApplicationRecord
  validates_presence_of :email, :password, :password_confirmation
  has_secure_password
  validates_length_of :password, minimum: 10
  validates :email, uniqueness: {case_sensitive: false}

  has_many :favorites
end
