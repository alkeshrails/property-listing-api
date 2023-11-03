class Property < ApplicationRecord
  has_many :favorite_properties
  has_many :favorites, through: :favorite_properties
end
