class PropertiesController < ApplicationController
    def index
      @properties = Property.all
  
      render json: @properties 
    end

    def show
      @property = Property.find(params[:id])
  
      render json: @property
    end

    def create
      @property = Property.new(property_params)

      if @property.save
        render json: @property, status: 200
      else
        render json: @property, status: 500
      end
    end

    def update
      @property = Property.find(params[:id])

      if @property.update(property_params)
        render json: @property, status: 200
      else
        render json: @property, status: 500
      end
    end

    def search_property
      search_params = params.permit(:property_type, :country, :area, :net_size, :rent).select { |_, v| v.present? }
      @properties = Property.where(search_params)
  
      render json: @properties
    end

    private
    def property_params
      params.permit(:property_type, :country, :area, :net_size, :rent)
    end
end