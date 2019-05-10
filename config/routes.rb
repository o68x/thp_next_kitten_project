# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # minimal carts and cats routes for dev purposes
  resources :cats
  resources :cart_cats, only: %i[create update destroy]
  resources :carts
  get 'download_cart_zip', to: "carts#download_cart_zip"
  resources :charges
  resources :profiles

  get 'admin', to: 'admin#index_admin'

  namespace :admin do
    resources :cats
    resources :carts
    resources :users
  end

  # root 'cats#index'
  root 'welcome#index'

  # static_pages
  get 'about', to: 'static_pages#about'
  get 'team_project', to: 'static_pages#team_project'
end
