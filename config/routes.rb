require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD
  root to: "home#index"
  
=======
  resources :pools do
    resources :teams
  end
>>>>>>> 2d5d73b89e74a5f249d19304503581a7cfec769c
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
