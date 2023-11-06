class Property < ApplicationRecord
  enum property_type: {
    residential: 'residential',
    office: 'office',
    retail: 'retail'
  }
  enum area: {
    taipei_city: 'Taipei City',
    new_taipei_city: 'New Taipei City'
  }
  has_many :favorite_properties, dependent: :destroy
  has_many :favorites, through: :favorite_properties

  scope :residential_properties, -> { where(property_type: 'residential') }
  scope :within_rent_range, ->(min_rent, max_rent) { where(rent: min_rent..max_rent) }
  scope :within_net_size_range, ->(min_size, max_size) { where(net_size: min_size..max_size) }
  scope :in_cities, ->(cities) { where(city: cities) if cities.present? }
  scope :in_districts, ->(districts) { where(area: districts) if districts.present? }
  scope :with_max_bedrooms, ->(max_bedrooms) { where('number_of_living_rooms <= ?', max_bedrooms) }

  validates :area, inclusion: { in: Property.areas.keys }
  validates :property_type, inclusion: { in: Property.property_types.keys }
end
