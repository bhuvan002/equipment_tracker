Rails.application.routes.draw do
  get 'equipments/create'

  # devise_scope :user do
  #   get '/sign_in', to: 'devise/sessions#new'
  #   get '/sign_up', to: 'devise/registrations#new', as: 'new_user_registration'
  # end

  devise_for :users, :store_managers, :lab_owners, :super_users
  root 'static_pages#home'

  resources :users, only: [:show]
  resources :store_managers, only: [:show]
  resources :lab_owners, only: [:show, :index]
  resources :super_users, only: [:show]

  resources :equipment, only: [:create, :index, :update, :show, :edit]
  
  resources :move_requests, only: [:create, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
