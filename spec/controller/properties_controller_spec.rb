# frozen_string_literal: true

# spec/controllers/properties_controller_spec.rb

require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  let!(:user) { (User.create(name: 'john_doe',email: 'john.doe@example.com',password: 'password123')) }
  let(:valid_attributes) do
    {
      title: 'House',
      address: '123 Main St',
      net_size: 100,
      rent: 1500,
      property_type: 'residential',
      area: 'taipei_city',
      number_of_living_rooms: 3,
      number_of_bathrooms: 2
    }
  end

  let(:invalid_attributes) do
    {
      title: 'Apartment',
      address: '456 Elm St',
      net_size: 80,
      rent: 2000,
      property_type: nil, # Invalid property_type
      area: 'new taipei city',
      number_of_living_rooms: 2,
      number_of_bathrooms: 1
    }
  end

  before do
    # Sign in the user using Devise's sign_in method
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      property = Property.create!(valid_attributes)
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      property = Property.create!(valid_attributes)
      get :show, params: { id: property.to_param }
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    before do
      user.user_type = 'admin'
      user.save!
    end
    context 'with valid parameters' do
      it 'creates a new Property' do
        expect {
          post :create, params: {property: valid_attributes}
        }.to change(Property, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: {property: valid_attributes}
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'returns an unprocessable_entity response' do
        expect {
          post :create, params: { property: invalid_attributes }
        }.to raise_error(ArgumentError, "'new taipei city' is not a valid area")
      end
    end
  end

  describe 'PUT #update' do
    before do
      user.user_type = 'admin'
      user.save!
    end
    let(:new_attributes) do
      {
        area: 'new_taipei_city'
      }
    end

    it 'updates the requested property' do
      property = Property.create!(valid_attributes)
      put :update, params: { id: property.id, property: new_attributes }
      property.reload
      expect(property.area).to eq('new_taipei_city')
    end

    it 'returns a success response' do
      property = Property.create!(valid_attributes)
      put :update, params: { id: property.to_param, property: valid_attributes }
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE #destroy' do
    before do
      user.user_type = 'admin'
      user.save!
    end
    it 'destroys the requested property' do
      property = Property.create!(valid_attributes)
      expect {
        delete :destroy, params: { id: property.id }
      }.to change(Property, :count).by(-1)
    end

    it 'returns a success response' do
      property = Property.create!(valid_attributes)
      delete :destroy, params: { id: property.to_param }
      expect(response).to have_http_status(200)
    end
  end
end
