Rails.application.routes.draw do
  get 'users/show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :questions
  resources :answers, only: [:create]
  resources :users, only: [:show]

  root to: 'home#index'
  get 'home/index'
  get 'about' => 'home#about', as: :about


  mount ActionCable.server => '/cable'
end
