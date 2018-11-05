class CoinCapApiInterface
  def get_assets
    response = conn.get('/v2/assets')
  end

  def conn
    Faraday.new(url: ENV['COINCAP_PATH'])
  end
end
