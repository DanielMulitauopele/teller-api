class Api::V1::HistoryController < ApplicationController
  def index
    render json: HistoryFacade.new.history(params[:asset_id], params[:interval])
  end
end
