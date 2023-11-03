class PropertiesController < ApplicationController
    def index
      @properties = Property.all
  
      render json: @properties 
    end
  
    def show
      @property = Property.find(params[:id])
  
      render json: @property
    end
  
    def search_property
      search_params = params.permit(:property_type, :country, :area, :net_size, :rent).select { |_, v| v.present? }
      @properties = Property.where(params[:title])
  
      render json: @properties
    end
  end