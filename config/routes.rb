# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # minimal carts and cats routes for dev purposes
  resources :cats
  resources :cart_cats, only: %i[create destroy]
  resources :carts
  get 'download_cart_zip', to: "carts#download_cart_zip"
  resources :charges

  get 'admin', to: 'admin#index_admin'

  namespace :admin do
    resources :cats
    resources :carts
    resources :profiles
  end
  root 'cats#index'
end
