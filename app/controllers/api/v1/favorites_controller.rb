class Api::V1::FavoritesController < ApplicationController
  def index
    render json: Favorite.where(user_id: @current_user.id)
  end
end
