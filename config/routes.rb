TaskManager::Application.routes.draw do
  scope module: :web do
    resources :tasks do
      scope module: :tasks do
        resources :comments, only: [:create, :destroy]
      end
    end
    resources :users
    resource :session, only: [:new, :create, :destroy]

    root :to => "tasks#index"
  end
end
