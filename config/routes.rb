Rails.application.routes.draw do
    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
    get '/properties/search', to: 'properties#search_property', as: 'search_property'
    get '/favorites/add_favorite'

    resources :properties
    resources :favorite_properties, only: [:create]
    resources :favorites, only: [:index]

end

