class HistoryFacade
  def history(coin, interval)
    cc_service.get_history(coin, interval).map do |history_snapshot|
      Snapshot.new(history_snapshot)
    end
  end

  private

  def cc_service
    CoinCapApiInterface.new
  end
end
