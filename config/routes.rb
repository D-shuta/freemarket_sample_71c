Rails.application.routes.draw do
  devise_for :user_addresses
  devise_for :users
  root to: 'top_pages#index'
  resources :items, only: [:new, :create]

end
