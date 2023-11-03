class FavoritePropertiesController < ApplicationController
  def create
    @favorite_property = FavoriteProperty.new(favorite_id: params[:favorite_id], property_id: params[:property_id])

    if @favorite_property.save
      render json: @favorite_property, status: 200
    else
      render json: @favorite_property, status: :unprocessable_entity
    end
  end
end
