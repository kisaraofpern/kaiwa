Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :anilistapi, only: [:index]
      resources :titleapi, only: [:index]
    end
  end
end
