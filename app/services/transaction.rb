class Transaction
  def initialize(tx_data)
    @currency_in = tx_data[:curIn]
    @currency_out = tx_data[:curOut]
    @amount = tx_data[:amount]
    @timestamp = tx_data[:timestamp]
  end
end
