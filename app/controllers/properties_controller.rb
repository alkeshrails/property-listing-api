class PropertiesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_config, only: :search_property

  def index
    @properties = Property.all.order(rent: :asc)

    update_favorite_properties

    render json: { data: @properties, count: @properties.count }, status: 200
  end

  def show
    @property = Property.find(params[:id])

    render json: @property
  end

  def create
    return unauthorized_message unless admin?

    @property = Property.new(property_params)

    if @property.save
      render json: @property, status: :ok
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def update
    return unauthorized_message unless admin?

    @property = Property.find(params[:id])

    if @property.update(property_params)
      render json: @property, status: :ok
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def destroy
    return unauthorized_message unless admin?

    property = Property.find(params[:id])

    if property
      property.destroy
      render json: { message: 'Property Deleted Successfully' }, status: :ok
    else
      unauthorized_message
    end
  end

  def search_property
    min_rent = params[:min_rent] || @config_data['min_rent']
    max_rent = params[:max_rent] || @config_data['max_rent']
    min_net_size = params[:min_net_size] || @config_data['min_net_size']
    max_net_size = params[:max_net_size] || @config_data['max_net_size']
    cities = params[:city]
    districts = params[:district]
    max_bedrooms = params[:max_bedrooms] || @config_data['max_bedrooms']

    @properties = Property.residential_properties
                          .within_rent_range(min_rent, max_rent)
                          .within_net_size_range(min_net_size, max_net_size)
                          .in_cities(cities)
                          .in_districts(districts)
                          .with_max_bedrooms(max_bedrooms.to_i)

    properties = @properties.present? ? @properties : Property.all

    render json: properties
  end

  private

    def admin?
      current_user.user_type == 'admin'
    end

    def load_config
      @config_data = YAML.load_file("#{Rails.root}/config/config.yml").symbolize_keys
    end

    def property_params
      params.require(:property).permit(:property_type, :country, :area, :net_size, :rent)
    end

    def update_favorite_properties
      return unless current_user&.favorite&.favorite_properties&.any?

      current_user&.favorite&.favorite_properties&.each do |favorite_property|
        property = Property.find(favorite_property.property_id)
        property.is_favorite = true
        property.save
      end
    end

    def unauthorized_message
      render json: 'You are not authorized to perform this action', status: :unauthorized
    end
end
