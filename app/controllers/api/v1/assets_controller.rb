class Api::V1::AssetsController < ApplicationController
  def index
    render json: AssetFacade.new.assets
  end
end
