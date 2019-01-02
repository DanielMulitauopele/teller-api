class AssetFacade
  def assets
    cc_service.get_assets.map do |asset_details|
      Asset.new(asset_details)
    end
  end

  def asset(coin_name)
    Asset.new(cc_service.get_asset(coin_name)[:data])
  end

  private

  def cc_service
    CoinCapApiInterface.new
  end
end
