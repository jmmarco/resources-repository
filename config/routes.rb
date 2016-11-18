Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :posts
  resources :tags, only: [:index, :show]
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  get "users/:id/show" => 'users#show'

  get "/search" => 'posts#index'

  get "/posts/:id" => 'posts#show'

end
