# frozen_string_literal: true

Rails.application.routes.draw do
  # root 'static_pages#home'
  devise_for :users

  # minimal carts and cats routes for dev purposes
  resources :cats
  resources :cart_cats, only: [:create]

  root 'cats#index'
end
