class FavoritesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @favorites = current_user&.favorite&.favorite_properties

    @properties = Property&.find(@favorites&.pluck(:property_id)) if @favorites&.pluck(:property_id)&.any?

    return render json: {message: 'No favorite Properties found'}, status: :not_found if @properties.nil?
    render json: @properties, status: :ok
  end

  def add_favorite
    favorite = find_or_create_favorite
    favorite_property = build_favorite_property(favorite)

    if favorite_property.save
      render json: 'Favorite added successfully', status: :ok
    else
      render json: 'Failed to add to favorites', status: :unprocessable_entity
    end
  end

  def remove_favorite
    favorite_property = current_user&.favorite&.favorite_properties&.find_by(property_id: params[:property_id])

    if favorite_property
      property = Property.find(favorite_property.property_id)
      property.is_favorite = false
      property.save
      favorite_property.destroy
      render json: 'Removed successfully', status: :ok
    else
      render json: 'Favorite not found', status: :not_found
    end
  end

  private

    def find_or_create_favorite
      Favorite&.find_or_create_by(user_id: current_user&.id)
    end

    def build_favorite_property(favorite)
      property = Property.find_by(id: params[:property_id])
      property.is_favorite = true
      property.save
      FavoriteProperty.new(favorite_id: favorite.id, property_id: params[:property_id])
    end
end
