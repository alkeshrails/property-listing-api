Rails.application.routes.draw do
    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
    get '/properties/search', to: 'properties#search_property', as: 'search_property'
    resources :properties, only: [:create,:show]
      

end

