Rails.application.routes.draw do
  devise_for :users

  resources :pieces do
    resources :reviews
  end

  namespace :api do
    namespace :v1 do
      resources :reviews, only: [:create]
    end
  end

  root "pieces#index"
end
