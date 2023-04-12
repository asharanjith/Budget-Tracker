Rails.application.routes.draw do
  devise_for :users

  root "splash#index"

  resources :users

  resources :groups do
    resources :expenses
  end
end
