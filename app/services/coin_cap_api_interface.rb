class CoinCapApiInterface
  def get_assets
    get_json('/v2/assets')[:data]
  end

  def get_rates
    get_json('v2/rates')
  end

  def get_exchanges
    get_json('v2/exchanges')
  end

  def get_markets
    get_json('v2/markets')
  end

  private

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: ENV['COINCAP_PATH'])
  end
end
