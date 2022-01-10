require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
    root to: "home#index"
  resources :pools do 
      resources :matches do 
        resources :predictions
    end
  end
  resources :teams
  resources :leaderboards
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
