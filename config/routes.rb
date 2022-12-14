Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :pokemons, only: [:index, :new, :create]
  resources :sales, only: [:index, :update, :destroy]

  post 'sales/create', action: :create, controller: 'sales'

  get 'user/acquisitions', action: :acquisitions, controller: 'sales'
  get 'user/sales', action: :sales, controller: 'sales'

  root "home#index"

  resources :users, to: 'home#index'
end
