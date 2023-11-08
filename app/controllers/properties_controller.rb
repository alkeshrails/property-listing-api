class PropertiesController < ApplicationController
  # before_action :authenticate_user!
  before_action :load_config, only: :search_property

  def index
    @properties = Property.all.order(id: :asc)

    update_favorite_properties

    render json: { data: @properties }, status: 200
  end

  def show
    @property = Property.find_by(id: params[:id])

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

    @property = Property.find_by(id: params[:id])

    if @property.update(property_params)
      @property.is_favorite = false
      @property.save!
      render json: @property, status: :ok
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def destroy
    return unauthorized_message unless admin?

    property = Property.find_by(id: params[:id])

    return render json: {message: 'No Properties found'}, status: :not_found if property.nil?

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
    property_type = params[:property_type]
    districts = params[:district]
    max_bedrooms = params[:max_bedrooms] || @config_data['max_bedrooms']

    @properties = Property.all # Initialize with all properties

    # Filter by property type if property_type is present
    if property_type.present?
      @properties = @properties.residential_properties(property_type)
    end
    
    # Filter by rent range if min_rent and max_rent are present
    if (min_rent.present? && max_rent.present?) && (max_rent.to_i != 0)
      @properties = @properties.within_rent_range(min_rent, max_rent)
    end
    
    # Filter by net size range if min_net_size and max_net_size are present
    if (min_net_size.present? && max_net_size.present?) && (max_net_size.to_i != 0)
      @properties = @properties.within_net_size_range(min_net_size, max_net_size)
    end
    
    # Filter by cities and districts if they are present
    if cities.present?
      @properties = @properties.in_cities(cities)
    end
    
    if districts.present?
      @properties = @properties.in_districts(districts)
    end
    
    # Filter by max bedrooms if max_bedrooms is present
    if max_bedrooms.present?
      @properties = @properties.with_max_bedrooms(max_bedrooms.to_i)
    end

    properties = @properties.present? ? @properties : Property.all.where(property_type: 'residential')

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
      params.require(:property).permit(:title, :address, :net_size, :rent, :property_type, :country, :area, :number_of_living_rooms, :number_of_bathrooms)
    end

    def update_favorite_properties
      if current_user&.favorite&.favorite_properties&.any?
        current_user&.favorite&.favorite_properties&.each do |favorite_property|
          property = Property.find(favorite_property.property_id)
          property.is_favorite = true
          property.save
        end
      else
        Property.all.each do |property|
          property.is_favorite = false
          property.save
        end
      end
    end

    def unauthorized_message
      render json: 'You are not authorized to perform this action', status: :unauthorized
    end
end
