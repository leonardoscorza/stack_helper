Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }


  resources :question
  root to: 'home#index'

  resources :questions


  get 'home/index'
  get 'about' => 'home#about', as: :about
end
