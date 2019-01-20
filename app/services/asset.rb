class Asset
  def initialize(asset_data)
    @name = asset_data[:id]
    @rank = asset_data[:rank]
    @symbol = asset_data[:symbol]
    @supply = asset_data[:supply]
    @max_supply = asset_data[:maxSupply]
    @market_cap_usd = asset_data[:marketCapUsd]
    @price_usd = asset_data[:priceUsd]
    @percent_change_24_hr = asset_data[:changePercent24Hr]
  end
end
