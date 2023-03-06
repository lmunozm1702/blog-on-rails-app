Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only:[:create, :new]
    end
  end
  resources :likes, only: [:create, :destroy]
end
