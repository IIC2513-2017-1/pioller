Rails.application.routes.draw do
  resources :tweets
  resources :users
  root 'home#index'
end
