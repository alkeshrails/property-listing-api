# spec/models/property_spec.rb

require 'rails_helper'

RSpec.describe Property, type: :model do
  it 'validates inclusion' do
    property = Property.new(property_type: 'office', area: 'taipei_city')
    expect(property.valid?).to be(true)
  end

  it 'raises an error for an invalid property_type' do
    expect do
      Property.create(property_type: 'house', area: 'Taipei City')
    end.to raise_error(ArgumentError, "'house' is not a valid property_type")
  end

  it 'raises an error for an invalid property_type' do
    expect do
      Property.create(property_type: 'office', area: 'city block')
    end.to raise_error(ArgumentError, "'city block' is not a valid area")
  end

  it 'has many favorite_properties' do
    association = described_class.reflect_on_association(:favorite_properties)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:dependent]).to eq(:destroy)
  end
end
