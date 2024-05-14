# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'products#index'

  resources :products, only: %i[index show]

  namespace :admin do
    resources :products, except: %i[show]
    resources :purchases, only: %i[index show]
  end

  resource :cart, only: %i[show create destroy]

  resources :purchases, only: %i[create]
end
