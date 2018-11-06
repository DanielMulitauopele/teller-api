class Api::V1::ExchangesController < ApplicationController
  def index
    render json: ExchangeFacade.new.exchanges
  end
end
