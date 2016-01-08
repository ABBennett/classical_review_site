Rails.application.routes.draw do
  devise_for :users

  resources :pieces do
    resources :reviews
  end


  root "pieces#index"
  get 'pieces_show' => 'pieces#show' 
end
