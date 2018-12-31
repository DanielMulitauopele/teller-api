class Snapshot
  def initialize(snapshot_data)
    @price = snapshot_data[:priceUsd]
    @time = snapshot_data[:time]
    @supply = snapshot_data[:circulatingSupply]
    @date = snapshot_data[:date]
  end
end
