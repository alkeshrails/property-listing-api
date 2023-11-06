# frozen_string_literal: true

FactoryBot.define do
  factory :property do
    property_type { 'residential' }
    country { 'Sample Country' }
    area { 'Sample Area' }
    net_size { 100 }
    rent { 500 }
  end
end