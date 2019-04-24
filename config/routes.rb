# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # minimal carts and cats routes for dev purposes
  resources :cats
  resources :cart_cats, only: [:create]

  namespace :admin do
    resources :cats
    # root 'admin#index' not created yet
  end
  root 'cats#index'
end
