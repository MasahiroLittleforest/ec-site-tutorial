Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "products#index"

  resource :basket, only: [:show]
  resource :charge, only: [:create]
  resources :products, only: [:new, :show, :create] do
    scope module: :products do
      resources :add_to_baskets, only: [:create]
      resources :remove_from_baskets, only: [:create]
    end
  end
end
