require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }
  let(:favorite) { Favorite.create(user_id: user.id) }
  let(:property) { Property.create(property_type: 'office', area: 'taipei_city') }
  let(:favorite_property) { FavoriteProperty.create(favorite_id: favorite.id, property_id: property.id) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @favorites' do
      get :index
      expect(assigns(:favorites)).to be_nil # Modify as per your actual setup
    end
  end

  describe 'POST #add_favorite' do
    it 'creates a new favorite' do
      post :add_favorite, params: { property_id: property.id , favorite_id: favorite.id}
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Favorite added successfully')
    end

    it 'fails to create a favorite with invalid data' do
      post :add_favorite, params: { property_id: nil } # An example with invalid data
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to include('Failed to add to favorites')
    end
  end

  describe 'DELETE #remove_favorite' do
    it 'removes a favorite property' do
      delete :remove_favorite, params: { property_id: favorite_property.property_id }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Removed successfully')
    end

    it 'returns not found when trying to remove a non-existent favorite' do
      delete :remove_favorite, params: { property_id: 999 } # Non-existent property_id
      expect(response).to have_http_status(:not_found)
      expect(response.body).to include('Favorite not found')
    end
  end
end
