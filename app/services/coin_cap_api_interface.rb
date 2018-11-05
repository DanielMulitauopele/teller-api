class CoinCapApiInterface
  def get_json(url)
    conn.get(url)
  end

  private

  def conn
    Faraday.new(url: ENV['COINCAP_PATH'])
  end

  def assets
    "/v2/assets"
  end
end
