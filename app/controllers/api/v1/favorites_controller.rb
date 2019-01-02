class Api::V1::FavoritesController < ApplicationController
  def index
    require "pry"; binding.pry
    render json: Favorite.all
  end
end
