Rails.application.routes.draw do
  
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :posts
  resources :tags, only: [:index, :show]
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  get "users/:id/show" => 'users#show'

  get "/search" => 'posts#index'

  get "/posts/:id" => 'posts#show'

  get '/admin/autocomplete_tags', to: 'admin/posts#autocomplete_tags', as: 'autocomplete_tags'

  post '/parse/nokogiri' => 'posts#parse'
  # get "/favorites/new"

  resources :favorites

end
