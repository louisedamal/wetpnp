Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :users, only: [:show, :edit, :update]

  get '/dashboard', to: 'pages#dashboard'
  get '/search', to: 'pools#search'

  resources :pools do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  
  resources :bookings, only: [:destroy, :index, :show, :edit, :update] do
    resources :messages, only: [:index, :new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
