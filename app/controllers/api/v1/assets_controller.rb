class Api::V1::AssetsController < ApplicationController
  skip_before_action :authenticate_user, :verify_authenticity_token

  def index
    render json: AssetFacade.new.assets
  end
end
