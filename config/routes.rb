Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  # RESTful
  resource :question

  # CRUD REST substituido pelo resource
  # get 'question/index'
  # get 'question/create'
  # get 'question/update'
  # get 'question/destroy'


  get 'home/index'
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
