# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'songs#index'
  resources :songs
  resources :albums
  resources :artists
  resources :bands

  get 'search', to: 'songs#search', as: 'search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
