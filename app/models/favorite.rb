class Favorite < ApplicationRecord
  belongs_to :user
  has_many :favorite_properties, dependent: :destroy
  has_many :properties, through: :favorite_properties
end
