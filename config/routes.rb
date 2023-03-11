Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only:[:create, :new, :destroy]
    end
  end
  resources :likes, only: [:create, :destroy]

  #Add API routes
  namespace :api do
    post 'login', to: 'login#index'
    #No resources for users
    resources :users, only: [] do
      #Just index for post list
      resources :posts, only: [:index] do
        #Create for new comment and index for comment list
        resources :comments, only: [:create, :index]
      end
    end
  end
end