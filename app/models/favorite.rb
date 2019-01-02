class Favorite < ApplicationRecord
  validates_presence_of :name, :price_usd, :percent_change_24_hr

  belongs_to :user
end
