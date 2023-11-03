class FavoriteProperty < ApplicationRecord
    belongs_to :favorite
    belongs_to :property
end
  