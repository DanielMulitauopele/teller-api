class AssetSerializer < ActiveModel::Serializer
  attributes :name, :symbol, :rank, :price_usd, :percent_change_24_hr
end
