class AssetFacade
  def assets
    cc_service.get_assets.map do |asset_details|
      Asset.new(asset_details)
    end
  end

  private

  def cc_service
    CoinCapApiInterface.new
  end
end
