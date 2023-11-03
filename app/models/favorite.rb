class Favorite < ApplicationRecord
  belongs_to :user
  has_many :favorite_properties
  has_many :properties, through: :favorite_properties
end
