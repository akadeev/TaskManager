TaskManager::Application.routes.draw do
  scope module: :web do
    resources :tasks do
      scope module: :tasks do
        resources :comments, only: [:create, :destroy]
      end
    end
    resources :users
    resources :sessions, only: [:new, :create, :destroy]

    root :to => "tasks#index"
  end
end
