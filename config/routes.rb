Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only:[:index, :create, :new, :destroy]
    end
  end
  resources :likes, only: [:create, :destroy]
end
