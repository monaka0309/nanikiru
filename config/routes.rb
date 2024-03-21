# frozen_string_literal: true

Rails.application.routes.draw do
  # ユーザー関連のルーティング
  resources :users, only: %i[new create]

  resource :profile, only: %i[show edit update]

  resources :user_sessions, only: [:create]
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'

  delete 'logout', to: 'user_sessions#destroy', as: :logout

  resources :posts do
    resources :post_tiles do
      resources :votes, only: %i[create destroy]
    end
    resources :comments, only: %i[create destroy]
  end
  post 'posts/:id', to: 'posts#create'

  # 静的ページ
  get 'about', to: 'pages#about' # アプリについて
  get 'contact', to: 'pages#contact' # 問い合わせページ
  get 'privacy_policy', to: 'pages#privacy_policy' # プライバシーポリシーページ
  get 'terms', to: 'pages#terms' # 利用規約ページ

  # ルートURL
  root 'posts#index'
end
