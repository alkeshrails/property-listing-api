class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(is_favorite: true)

    render json: @favorites, status: 200
  end

  def add_favorite

  end

  def remove_favorite
    
  end
end
