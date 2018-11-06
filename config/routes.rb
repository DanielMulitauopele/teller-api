Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/assets', to: 'assets#index'
    end
  end
end
