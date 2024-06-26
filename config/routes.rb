# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  get 'static_pages/about'
  get 'static_pages/privacy_policy'
  get 'static_pages/terms_of_service'

  resources :users, only: %i[new create]

  resources :profiles, only: %i[show edit update]

  resources :user_sessions, only: [:create]
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'

  delete 'logout', to: 'user_sessions#destroy', as: :logout

  resources :posts do
    resources :post_tiles do
      resources :votes, only: %i[create destroy]
    end
    resources :comments, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
  end
  post 'posts/:id', to: 'posts#create'

  post 'oauth/callback' => 'oauths#callback'
  get 'oauth/callback' => 'oauths#callback'
  get 'oauth/:provider' => 'oauths#oauth', :as => :auth_at_provider

  get 'search' => 'searches#search'
end
