Rails.application.routes.draw do
  resources :comments
  resources :tweets
  resources :users do
    resources :followers, only: [:create]
  end

  resources :followers, only: [:destroy]

  resource :session, only: [:new, :create, :destroy]
  root 'home#index'
end
