class CoinCapApiInterface
  def get_assets
    conn =  Faraday.new(url: ENV['COINCAP_PATH'])
    response = conn.get('/v2/assets')
  end
end
