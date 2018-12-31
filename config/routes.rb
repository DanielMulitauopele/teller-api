Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :assets, only: [:index]
      resources :assets, only: [:show] do
        resources :history, only: [:index]
      end
      
      resources :transactions, only: [:index]
      resources :exchanges, only: [:index]
    end
  end
  resources :authentications, only: [:create]
  resources :users, only: [:create]
end
