Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :question
  root to: 'home#index'
  get 'home/index'
  get 'home/about'
end
