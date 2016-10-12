Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :question
  root to: 'home#index'

  resources :questions, only: [:new, :create, :destroy, :edit, :update, :show]

  get 'home/index'
  get 'home/about'
end
