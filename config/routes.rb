Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/assets', to: 'assets#index'
      get '/transactions', to: 'transactions#index'
    end
  end
end
