# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pages
  root to: 'songs#index'
  resources :songs
  resources :albums
  resources :artists
  resources :bands

  get 'search', to: 'songs#search', as: 'search'
  get 'about', to: 'pages#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
