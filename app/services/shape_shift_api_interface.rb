class ShapeShiftApiInterface
  def get_market_info
    get_json('/marketinfo')
  end

  def get_shape_shift_coins
    get_json('/getcoins')
  end

  def get_recent_transactions
    get_json('/recenttx')
  end

  private

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: ENV['SHAPESHIFT_PATH'])
  end
end
