Rails.application.routes.draw do
  resources :pieces, only: [:new, :create]
end
