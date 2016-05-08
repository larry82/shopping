Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :items, only:[:index]
  root 'items#index'

  namespace :admin do
    resources :categories
    resources :items
  end
end
