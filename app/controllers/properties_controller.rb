class PropertiesController < ApplicationController
    before_action :authenticate_user!
    def index
      @properties = Property.all.order('rent Asc')
  
      render json: {data: @properties , count: @properties.count}
    end

    def show
      @property = Property.find(params[:id])
  
      render json: @property
    end

    def create
      if current_user.user_type == 'admin'
        @property = Property.new(property_params)

        if @property.save
          render json: @property, status: 200
        else
          render json: @property.errors, status: :unprocessable_entity
        end
      else
        render json: "You are not authorized to create property"  
      end  
    end

    def update

      if current_user.user_type == 'admin'
        @property = Property.find(params[:id])

        if @property.update(property_params)
          render json: @property, status: 200
        else
          render json: @property.errors, status: :unprocessable_entity
        end
      else
        render json: "You are not authorized to update property"  
      end
    end

    def search_property
      config_data = load_config.with_indifferent_access
      min_rent = params[:min_rent] || config_data['min_rent']
      max_rent = params[:max_rent] || config_data['max_rent']
      min_net_size = params[:min_net_size] || config_data['min_net_size']
      max_net_size = params[:max_net_size] || config_data['max_net_size']
      cities = params[:city]
      districts = params[:district]
      max_bedrooms = params[:max_bedrooms] || config_data['max_bedrooms']

      @properties = Property.residential_properties
        .within_rent_range(min_rent, max_rent)
        .within_net_size_range(min_net_size, max_net_size)
        .in_cities(cities)
        .in_districts(districts)
        .with_max_bedrooms(max_bedrooms.to_i)
        properties = if @properties.any?
          @properties 
        else 
          Property.all
        end
  
      render json: properties
    end

    private

    def load_config
      # Load the configuration from your config.yml file
      # Rails will automatically look for it in the config folder
      config_data = YAML.load_file("#{Rails.root}/config/config.yml")
      config_data.symbolize_keys
    end
    
    def property_params
      params.permit(:property_type, :country, :area, :net_size, :rent)
    end
end