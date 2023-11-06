# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FavoritePropertiesController, type: :controller do
  let!(:user) { User.create!(name: 'user123', password: 'test@test', email: 'test@gmail.com') }
  let!(:property) do
    Property.create(title: 'House',
                    address: '123 Main St',
                    net_size: 100,
                    rent: 1500,
                    property_type: 'residential',
                    area: 'taipei_city',
                    number_of_living_rooms: 3,
                    number_of_bathrooms: 2)
  end
  let!(:favorite_property) { FavoriteProperty.create(user_id: user.id, property_id: property.id) }

  describe 'GET #show' do
    context 'when there are favorite properties' do
      it 'returns a list of favorite properties' do
        get :show, params: { user_id: user.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when there are no favorite properties' do
      it 'returns a not found response' do
        user.favorite_properties.destroy_all
        get :show, params: { user_id: user.id }
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)).to eq({ 'message' => 'No Favorite Properties Added yet...' })
      end
    end
  end

  describe 'POST #create' do
    it 'creates a new favorite property' do
      post :create, params: { user_id: user.id, property_id: property.id }
      expect(response).to have_http_status(:created)
    end

    it 'returns errors for invalid favorite property creation' do
      post :create, params: { user_id: user.id, property_id: nil }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to include('errors')
    end
  end

  describe 'DELETE #remove_favorite' do
    context 'when the favorite property exists' do
      it 'removes the favorite property' do
        delete :remove_favorite, params: { user_id: user.id, property_id: property.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the favorite property does not exist' do
      it 'returns an internal server error' do
        delete :remove_favorite, params: { user_id: user.id, property_id: property.id + 1 }
        expect(response).to have_http_status(:internal_server_error)
        expect(JSON.parse(response.body)).to eq({ 'message' => 'Unable to delete' })
      end
    end
  end
end
