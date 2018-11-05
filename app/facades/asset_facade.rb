class AssetFacade
  def assets
    cc_service.get_assets.map do |asset_details|
      Asset.create!(
        name: asset_details[:name],
        rank: asset_details[:rank],
        symbol: asset_details[:symbol],
        supply: asset_details[:supply],
        max_supply: asset_details[:maxSupply],
        market_cap_usd: asset_details[:marketCapUsd],
        price_usd: asset_details[:priceUsd],
        percent_change_24_hr: asset_details[:changePercent24Hr]
      )
    end
  end

  private

  def cc_service
    CoinCapApiInterface.new
  end
end
