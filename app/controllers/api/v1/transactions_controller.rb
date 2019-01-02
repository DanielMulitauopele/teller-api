class Api::V1::TransactionsController < ApplicationController
  skip_before_action :authenticate_user, :verify_authenticity_token

  def index
    render json: TransactionFacade.new.transactions
  end
end
