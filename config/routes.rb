# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :product_steps
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'products#index'
  get :hello_world, to: 'pages#hello_world'
end
