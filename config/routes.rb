Rails.application.routes.draw do
  # ユーザー関連のルーティング
  resources :users, only: [:new, :create]

  # ログイン・ログアウト関連のルーティング
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create', as: :user_sessions
  delete 'logout', to: 'user_sessions#destroy', as: :logout

  # 投稿関連のルーティング
  resources :posts

  # ルートURL
  root "posts#index"
end
