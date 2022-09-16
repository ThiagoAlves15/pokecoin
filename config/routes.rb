Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :sales
  resources :pokemons

  root "home#index"
end
