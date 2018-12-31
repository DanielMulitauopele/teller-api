class Api::V1::AssetsController < ApplicationController
  def index
    render json: AssetFacade.new.assets
  end

  def show
    render json: AssetFacade.new.asset(params[:id])
  end
end
