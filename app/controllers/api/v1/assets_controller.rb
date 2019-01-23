class Api::V1::AssetsController < ApplicationController
  skip_before_action :authenticate_user, :verify_authenticity_token

  def index
    render json: AssetFacade.new.assets, each_serializer: AssetSerializer
  end

  def show
    render json: AssetFacade.new.asset(params[:id])
  end
end
