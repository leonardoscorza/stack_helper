Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resource :question

  get 'home/index'
  get 'home/about'
end
