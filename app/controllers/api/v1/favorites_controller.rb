class Api::V1::FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Favorite.where(user_id: @current_user.id)
  end

  def create
    favorite = @current_user.favorites.create(fav_params)
    if favorite.save
      render json: {notice: "Favorite added!"},
             status: 201
    else
      render json: {error: "Something went wrong. Your favorite did not save. Please try again."},
             status: 400
    end
  end

  private

  def fav_params
    params.require(:favorite).permit(:name, :price_usd, :percent_change_24_hr)
  end
end
