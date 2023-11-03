class Property < ApplicationRecord
  enum type: {
    residential: 'residential',
    office: 'office',
    retail: 'retail'
  }
  enum city: {
    taipei_city: 'Taipei City',
    new_taipei_city: 'New Taipei City'
  }
  has_many :favorite_properties
  has_many :favorites, through: :favorite_properties
end
