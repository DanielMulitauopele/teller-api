class User < ApplicationRecord
  validates_presence_of :email, :password, :password_confirmation
  has_secure_password
end
