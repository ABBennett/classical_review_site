Rails.application.routes.draw do
  devise_for :users

  resources :welcome, only: [:index]

  resources :pieces, only: [:new, :create, :index, :show]
  root "pieces#index"
end
