Rails.application.routes.draw do
  devise_for :users

  root "splash#index"

  resources :users

  resources :groups, only: [:index, :new, :create] do
    resources :expenses, only: [:index, :new, :create]
  end
end
