Rails.application.routes.draw do
  root 'products#index'

  devise_for :users

  namespace :admin do
    root 'products#index'
    resources :products
    resources :categories
  end
end
