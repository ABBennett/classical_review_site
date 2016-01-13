Rails.application.routes.draw do
  devise_for :users

  resources :pieces do
    resources :reviews
  end
  
  resources :votes, only: [:create], defaults: { format: 'json' }


  root "pieces#index"
end
