Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index]

  resources :pieces do
    resources :reviews
  end

  root "pieces#index"
end
