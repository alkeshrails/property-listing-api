require 'rails_helper'

RSpec.describe FavoriteProperty, type: :model do
  it 'validates the presence of user_id' do
    favorite_property = FavoriteProperty.new(property_id: 1)
    expect(favorite_property).not_to be_valid
  end

  it 'validates the presence of property_id' do
    favorite_property = FavoriteProperty.new(favorite_id: 1)
    expect(favorite_property).not_to be_valid
  end
end
