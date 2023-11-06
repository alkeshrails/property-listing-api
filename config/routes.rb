Rails.application.routes.draw do
  get 'current_user/index'
    devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
    get '/properties/search', to: 'properties#search_property', as: 'search_property'
    post '/favorites/add_favorite', to: 'favorites#add_favorite', as: 'add_favorite'
    delete '/favorites/remove_favorite', to: 'favorites#remove_favorite', as: 'remove_favorite'

    resources :properties
    resources :favorite_properties, only: [:create]
    resources :favorites, only: [:index]
    get '/current_user', to: 'current_user#index'

end

