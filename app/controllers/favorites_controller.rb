class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def index
    @favorites = current_user.favorite&.favorite_properties

    render json: @favorites, status: 200
  end

  def add_favorite
    favorite = Favorite.create(user_id: current_user.id)
    FavoriteProperty.new(favorite_id: favorite.id, property_id: params[:property_id])
    render json: "Faviorite added successfully"
  end

  def remove_favorite
    current_user.favorite.favorite_properties.where(property_id: params[:property_id]).destroy
    render json: "removed successfully"
  end
end
