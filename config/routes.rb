# frozen_string_literal: true

Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'products#index'

  resources :products, only: %w[index show]

  namespace :admin do
    resources :products, except: ['show']
  end

  # get '/my_cart' => 'carts#my_cart'
  # post '/add_item' => 'carts#create'
  # delete '/delete_item' => 'carts#destroy'
  resource :cart, only: %i[show create destroy]
end
