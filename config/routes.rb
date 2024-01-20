Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  resources :posts
  resources :users, only: [:new, :create]
  root "posts#index"
end
