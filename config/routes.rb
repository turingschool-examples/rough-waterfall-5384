Rails.application.routes.draw do
  resources :customers, only: [:show]
  resources :supermarkets, only: [:show] do
    resources :items, only: [:index]
  end
end
