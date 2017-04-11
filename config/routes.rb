Rails.application.routes.draw do
  resources :comments
  resources :tweets
  resources :users
  root 'home#index'
end
