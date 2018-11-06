class Exchange
  def initialize(exchange_data)
    @name = exchange_data[:name]
    @dollar_volume = exchange_data[:volumeUsd]
    @volume_percentage = exchange_data[:percentTotalVolume]
    @available_pairs = exchange_data[:tradingPairs]
    @url = exchange_data[:exchangeUrl]
    @timestamp = exchange_data[:updated]
  end
end
