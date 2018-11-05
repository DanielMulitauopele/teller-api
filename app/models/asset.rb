class Asset < ApplicationRecord
  validates_presence_of :name,
                        :supply,
                        :market_cap_usd,
                        :price_usd
end
