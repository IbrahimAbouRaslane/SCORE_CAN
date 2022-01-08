require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :matches
  resources :pools do 
    resources :teams do
      resources :matches
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
