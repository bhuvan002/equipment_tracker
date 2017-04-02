Rails.application.routes.draw do
  # devise_scope :user do
  #   get '/sign_in', to: 'devise/sessions#new'
  #   get '/sign_up', to: 'devise/registrations#new', as: 'new_user_registration'
  # end

  devise_for :users, :store_managers, :lab_owners
  root 'static_pages#home'

  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
