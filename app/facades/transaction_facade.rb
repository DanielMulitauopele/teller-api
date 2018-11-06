class TransactionFacade
  def transactions
    ss_service.get_recent_transactions.map do |tx_data|
      Transaction.new(tx_data)
    end
  end

  private

  def ss_service
    ShapeShiftApiInterface.new
  end
end
