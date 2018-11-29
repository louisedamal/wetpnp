Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :users, only: [:show, :edit, :update]

  get '/dashboard', to: 'pages#dashboard'

  resources :pools do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:destroy, :index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
