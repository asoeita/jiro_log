# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get  'profile_edit/:id', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update/:id', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  root 'jiros#index'
  resources :users

  resources :jiros do
    collection do
      match 'search' => 'jiros#search', via: [:get, :post]
    end
  end

  resources :favorites, only: [:create, :destroy]

  #いいね機能
  post '/favorite/:jiro_id' => 'favorites#like', as: 'like'
  delete '/favorite/:jiro_id' => 'favorites#unlike', as: 'unlike'
end
