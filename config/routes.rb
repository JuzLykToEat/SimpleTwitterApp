Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'landing#index'
  post :like, to: 'votes#like'

  resources :users, only: [:show]
  resources :tweets, only: [:create]
  resources :followers, only: [:create, :destroy]
end
