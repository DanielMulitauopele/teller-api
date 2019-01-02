class Api::V1::HistoryController < ApplicationController
  def index
    if params[:asset_id] && params[:interval]
      render json: HistoryFacade.new.history(params[:asset_id], params[:interval])
    elsif params[:asset_id]
      render json: {error: "Please choose a valid interval (m1, m5, m15, m30, h1, h2, h6, h12, d1) to examine history."}
    else
      render json: {error: "Please choose a coin to examine."}
    end
  end
end
