Rails.application.routes.draw do
  resources :pieces, only: [:new, :create, :index, :show]
  root "pieces#index"
end
