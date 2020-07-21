Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'homes#top'

  resources :users, only: [:show, :edit, :update]

  resources :books, only: [:new , :create, :index, :show]

  get "users/:id" => "users#show", as: 'show_user'

  get "homes/about" => 'homes#about'


end
