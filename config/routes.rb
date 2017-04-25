Rails.application.routes.draw do
  resources :comments
  resources :tweets
  resources :users
  resource :session, only: [:new, :create, :destroy]
  root 'home#index'
end
