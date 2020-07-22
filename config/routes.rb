Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'homes#top'

  resources :users, only: [:show, :edit, :update, :index, :destroy]

  resources :books

  get "users/:id" => "users#show", as: 'show_user'

  get "home/about" => 'homes#about'


end
