class Api::V1::TransactionsController < ApplicationController
  def index
    render json: TransactionFacade.new.transactions
  end
end
