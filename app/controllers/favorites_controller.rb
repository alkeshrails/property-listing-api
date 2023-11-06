class FavoritesController < ApplicationController
  # before_action :authenticate_user!
  def index
    @favorites = current_user.favorite&.favorite_properties

    render json: @favorites, status: 200
  end

  def add_favorite
    favorite = Favorite.find_or_create_by(user_id: current_user.id)
    favorite_property = FavoriteProperty.new(favorite_id: favorite.id, property_id: params[:property_id])
    if favorite_property.save
      render json: "Faviorite added successfully"
    else
      render json: "Faviorite Not able to be added."
    end
  end

  def remove_favorite
    current_user.favorite.favorite_properties.find_by(property_id: params[:property_id]).destroy
    render json: "removed successfully"
  end
end
