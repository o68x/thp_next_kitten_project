# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # minimal carts and cats routes for dev purposes
  resources :cats
  resources :cart_cats, only: [:create, :destroy]
  resources :carts

  root 'cats#index'
end
