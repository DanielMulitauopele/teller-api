class ExchangeFacade
  def exchanges
    cc_service.get_exchanges.map do |exchange_details|
      Exchange.new(exchange_details)
    end
  end

  private

  def cc_service
    CoinCapApiInterface.new
  end
end
