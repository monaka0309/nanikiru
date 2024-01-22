Rails.application.routes.draw do
  # ユーザー関連のルーティング
  resources :users, only: [:new, :create, :show]

  # ログイン・ログアウト関連のルーティング
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create', as: :user_sessions
  delete 'logout', to: 'user_sessions#destroy', as: :logout

  # 投稿関連のルーティング
  resources :posts

  # 静的ページ
  get 'about', to: 'pages#about' # アプリについて
  get 'contact', to: 'pages#contact' # 問い合わせページ
  get 'privacy_policy', to: 'pages#privacy_policy' # プライバシーポリシーページ
  get 'terms', to: 'pages#terms' # 利用規約ページ

  # ルートURL
  root "posts#index"

  # 追加機能に関するルーティングが必要な場合はここに追加
  # 例: 通知機能
  # resources :notifications, only: [:index]
end
