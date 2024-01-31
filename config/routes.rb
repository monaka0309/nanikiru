Rails.application.routes.draw do
  # ユーザー関連のルーティング
  resources :users, only: [:new, :create, :show]

  resources :user_sessions, only: [:create]
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'

  delete 'logout', to: 'user_sessions#destroy', as: :logout

  # 投稿関連のルーティング
  resources :posts do
    resources :votes, only: [:create, :destroy]
  end


  # 静的ページ
  get 'about', to: 'pages#about' # アプリについて
  get 'contact', to: 'pages#contact' # 問い合わせページ
  get 'privacy_policy', to: 'pages#privacy_policy' # プライバシーポリシーページ
  get 'terms', to: 'pages#terms' # 利用規約ページ

  # ルートURL
  root "posts#index"

end
