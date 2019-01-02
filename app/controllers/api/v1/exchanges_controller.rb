class Api::V1::ExchangesController < ApplicationController
  skip_before_action :authenticate_user, :verify_authenticity_token

  def index
    render json: ExchangeFacade.new.exchanges
  end
end
