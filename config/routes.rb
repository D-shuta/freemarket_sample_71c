Rails.application.routes.draw do
  devise_for :users
  root to: 'top_pages#index'
  resources :items, only: [:new, :create]
  resources :categories, only: [:new, :create]
  resources :brands, only: [:index]
  resources :cards, only: [:new, :destroy, :edit, :update]
end
