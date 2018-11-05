class CoinCapApiInterface
  def get_assets
    get_json('/v2/assets')
  end

  private

  def get_json(url)
    conn.get(url)
  end

  def conn
    Faraday.new(url: ENV['COINCAP_PATH'])
  end
end
