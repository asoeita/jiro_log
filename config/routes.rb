# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get  'profile_edit/:id', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update/:id', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  root 'users#index'
  resources :users
  resources :jiros
end
