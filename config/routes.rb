Rails.application.routes.draw do
  devise_for :users

  resources :pieces, only: [:new, :create, :index, :show] do
    resources :reviews
  end

  root "pieces#index"
end
