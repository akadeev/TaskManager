TaskManager::Application.routes.draw do
  resources :tasks
  resources :users
  resources :comments, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  root :to => "tasks#index"
end
