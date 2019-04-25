# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # minimal carts and cats routes for dev purposes
  resources :cats
  resources :cart_cats, only: %i[create destroy]
  resources :carts

  namespace :admin do
    resources :cats
    # root 'admin#index' not created yet
  end
  root 'cats#index'
end
