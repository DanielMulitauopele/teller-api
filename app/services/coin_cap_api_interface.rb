class CoinCapApiInterface
  def get_assets
    get_json('/v2/assets')[:data]
  end

  def get_asset(coin_name)
    get_json("/v2/assets/#{coin_name}")
  end

  def get_rates
    get_json('v2/rates')
  end

  def get_exchanges
    get_json('v2/exchanges')[:data]
  end

  def get_markets
    get_json('v2/markets')
  end

  def get_history(coin, interval)
    get_json("/v2/assets/#{coin}/history?interval=#{interval}")[:data]
  end

  private

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: ENV['COINCAP_PATH'])
  end
end
